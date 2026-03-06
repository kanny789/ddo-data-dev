-- created_at: 2026-03-06T07:01:21.496445+00:00
-- finished_at: 2026-03-06T07:01:23.519969+00:00
-- elapsed: 2.0s
-- outcome: success
-- dialect: databricks
-- node_id: not available
-- query_id: 01f1192a-483e-1c3c-b13f-a51f12942054
-- desc: execute adapter call
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "y", "target_name": "dev"} */
SHOW SCHEMAS IN `databricks_catalog`;
-- created_at: 2026-03-06T07:01:26.070872+00:00
-- finished_at: 2026-03-06T07:01:28.867864+00:00
-- elapsed: 2.8s
-- outcome: success
-- dialect: databricks
-- node_id: model.ddo_data_dev.example_model
-- query_id: 01f1192a-4af9-1655-a156-5bf07ab1319e
-- desc: get_relation > list_relations call

SELECT
    table_name,
    if(table_type IN ('EXTERNAL', 'MANAGED', 'MANAGED_SHALLOW_CLONE', 'EXTERNAL_SHALLOW_CLONE'), 'table', lower(table_type)) AS table_type,
    lower(data_source_format) AS file_format,
    table_schema,
    table_owner,
    table_catalog,
    if(
    table_type IN (
        'EXTERNAL',
        'MANAGED',
        'MANAGED_SHALLOW_CLONE',
        'EXTERNAL_SHALLOW_CLONE'
    ),
    lower(table_type),
    NULL
    ) AS databricks_table_type
FROM `system`.`information_schema`.`tables`
WHERE table_catalog = 'databricks_catalog'
    AND table_schema = 'bronze';
-- created_at: 2026-03-06T07:01:28.878308+00:00
-- finished_at: 2026-03-06T07:01:30.482421+00:00
-- elapsed: 1.6s
-- outcome: success
-- dialect: databricks
-- node_id: model.ddo_data_dev.example_model
-- query_id: 01f1192a-4ca4-1e1a-9bf5-55d2bc55bdcb
-- desc: execute adapter call
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.ddo_data_dev.example_model", "profile_name": "y", "target_name": "dev"} */
create or replace view `databricks_catalog`.`bronze`.`example_model`
  
  as (
    select 1
  );
