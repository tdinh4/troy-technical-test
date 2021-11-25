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

def extract():
    src = PostgresHook(postgres_conn_id='db_source', schema="dbsource")
    src_conn = src.get_conn()
    cursor = src_conn.cursor()
    cursor.execute("SELECT * FROM db_source;")
    data_source = cursor.fetchall()
    print(data_source)

with DAG('postgres_migration',
        default_args=default_args,
        schedule_interval=None,
        catchup=False
        ) as dag:

        extract_task = PythonOperator(
            task_id='extract_task',
            python_callable=extract
        )

extract_task
        
         