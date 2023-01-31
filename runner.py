import os
import django


os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'event.settings')
django.setup()


from demo.models import Event, Booking, Hours
from django.utils import timezone
from datetime import timedelta
from utils.db_logger import db_query_logger
from django.db.models.functions import ExtractHour, Cast
from django.db.models import F, IntegerField, Func, Value, Case, When, Sum
from django.db.models.aggregates import Aggregate
from django.contrib.postgres.aggregates.general import ArrayField


class ArrayLength(Func):
    function = 'CARDINALITY'


class GenerateArrayFromRange(Aggregate):
    template = """(ARRAY(SELECT a.n FROM generate_series(%(expressions)s)  AS a(n)))"""


class ArrayPosition(Func):
    template = "array_position(%(expressions)s)"


def setup():
    event_1 = Event.objects.create(
        name="Event 1"
    )
    event_2 = Event.objects.create(
        name="Event 2"
    )
    now = timezone.now()
    now = now.replace(hour=9)
    booking_1 = Booking.objects.create( # 10:00-11:00
        event=event_1,
        time_start=now + timedelta(hours=1),
        duration=60
    )
    booking_2 = Booking.objects.create(  # 10:00-12:00
        event=event_1,
        time_start=now + timedelta(hours=1),
        duration=120
    )
    booking_3 = Booking.objects.create(  # 10:00-10:30
        event=event_1,
        time_start=now + timedelta(hours=1),
        duration=30
    )
    booking_3 = Booking.objects.create(  # 11:00-12:00
        event=event_1,
        time_start=now + timedelta(hours=2),
        duration=60
    )


def setup_hours():
    for h in range(24):
        Hours.objects.create(number=h)


def orm_query():
    import sqlparse

    def get_hour_position(hour: int):
        return ArrayPosition(F("number_range"), Value(hour), output_field=IntegerField())

    def get_hour(hour: int):
        kwarg = {
            f"hour_{hour}_position__isnull": False
        }
        return Case(
            When(
                **kwarg,
                then=Value(1)
            ),
            default=Value(0)
        )

    def get_hour_kwargs():
        kwargs = {}
        for hour in range(23):
            kwargs[f"hour_{hour}_position"] = get_hour_position(hour)
            kwargs[f"hour_{hour}"] = get_hour(hour)
        return kwargs

    res = (
        Event.objects.filter(booking__isnull=False)
        .values("booking__id")
        .annotate(
            event_id=F("id"),
            hour_start=Cast(ExtractHour("booking__time_start"), IntegerField()),
            hour_end=Cast(F("hour_start") + F("booking__duration") / 60 + 1, IntegerField()),
            number_range=GenerateArrayFromRange(
                F("hour_start"), F("hour_end"), output_field=ArrayField(IntegerField())
            ),
            count=ArrayLength(F("number_range"), output_field=IntegerField()),
            **get_hour_kwargs()
        )
    )
    print(list(res))
    res_aggr_kwargs = {
        f"hour_{h}_count": Sum(F(f"hour_{h}")) for h in range(23)
    }
    res_aggr = res.aggregate(
        **res_aggr_kwargs
    )
    print(res_aggr)




@db_query_logger()
def main():
    orm_query()


if __name__ == '__main__':
    main()

