import logging
import os
import re
import time
from functools import wraps

import sqlparse
from django.conf import settings
from django.db import connection

logger = logging.getLogger(__name__)
QUERY_LOG_FOLDER = os.path.join(settings.BASE_DIR, "queries_log")


def _get_or_create_file_path(func):  # pragma: no cover
    if not os.path.exists(QUERY_LOG_FOLDER):
        os.mkdir(QUERY_LOG_FOLDER)
    file_name = func.__repr__()
    file_name = re.findall(r"<(.*?) at .*?>", file_name)[0]
    file_path = os.path.join(QUERY_LOG_FOLDER, f"{file_name}.sql")
    if os.path.exists(file_path):
        os.remove(file_path)
    return file_path, file_name


def _place_logs(
    func,
    start_queries_count,
    end_queries_count,
    query_execution_time,
    func_execution_time,
    to_stdout=True,
    to_file=True,
):  # pragma: no cover
    diff = end_queries_count - start_queries_count

    if to_stdout:
        logger.info(
            f"--Connection queries count for wrapped method {func.__repr__()} is {diff}"
        )
        logger.info(f"--Total query execution time: {query_execution_time}")
        logger.info(f"--Total function execution time: {func_execution_time}")
        for query in connection.queries[start_queries_count:]:
            logger.info(f'--{query["time"]}sec|')
            logger.info(f'--{"-" * len(query["time"])}---|--*{query["sql"]}')

    if to_file:
        file_path, file_name = _get_or_create_file_path(func)
        with open(file_path, "a") as f:
            f.write(f"# File path: {func.__code__.co_filename}")
            f.write(f"\n# Function: {file_name}")
            f.write(f"\n# Queries count for wrapped method: {diff}")
            f.write(f"\n# Total query execution time: {query_execution_time}")
            f.write(f"\n# Total function execution time: {func_execution_time}")
            f.write(f"\n")
            for query in connection.queries[start_queries_count:]:
                q_string = query["sql"]
                f.write(
                    sqlparse.format(
                        f"\n{q_string};", reindent=True, keyword_case="upper"
                    )
                )
                f.write("\n")
                f.write("\n")
            f.write("\n#")


def db_query_logger(to_stdout: bool = True, to_file: bool = True):  # pragma: no cover
    def decorator(func):
        @wraps(func)
        def wrapper(*args, **kwargs):

            time_start = time.time()
            start_queries_count = len(connection.queries)

            result = func(*args, **kwargs)

            end_queries_count = len(connection.queries)
            func_total_execution_time = time.time() - time_start
            query_total_execution_time = sum(
                [
                    float(query["time"])
                    for query in connection.queries[start_queries_count:]
                ]
            )
            func_total_execution_time = round(func_total_execution_time, 4)
            query_total_execution_time = round(query_total_execution_time, 4)

            _place_logs(
                func,
                start_queries_count,
                end_queries_count,
                query_total_execution_time,
                func_total_execution_time,
                to_stdout=to_stdout,
                to_file=to_file,
            )
            return result

        return wrapper

    return decorator
