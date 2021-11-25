from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.postgres_operator import PostgresOperator
from airflow.hooks.postgres_hook import PostgresHook
from airflow.operators.python_operator import PythonOperator
default_args = {
    'owner': 'Troy',
    'depend_on_past': False,
    'start_date':datetime(2021, 1, 1)
}

def extract_and_load():
    src = PostgresHook(postgres_conn_id='db_source', schema="dbsource")
    src_conn = src.get_conn()
    src_cursor = src_conn.cursor()

    target = PostgresHook(postgres_conn_id='db_target', schema="dbtarget")
    target_conn = target.get_conn()
    target_cursor = target_conn.cursor()

    src_cursor.execute("SELECT * FROM db_source;")
    target.insert_rows(table="db_target", rows=src_cursor)

with DAG('postgres_migration',
        default_args=default_args,
        schedule_interval=None,
        catchup=False
        ) as dag:

        extract_and_load_task = PythonOperator(
            task_id='extract_and_load_task',
            python_callable=extract_and_load
        )

extract_and_load_task