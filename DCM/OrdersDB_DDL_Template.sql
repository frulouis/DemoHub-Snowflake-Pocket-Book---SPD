--!jinja
 
{% set database_name = 'ordersdb_' + DEPLOYMENT_TYPE + '_' + BU_GEO %}
{% set s3_url = 's3://' + BUCKET_NAME + '/data/orders' %}

-- +----------------------------------------------------+
-- |       1. DATABASE AND SCHEMA SETUP       |
-- +----------------------------------------------------+

CREATE OR REPLACE DATABASE {{ database_name }};
USE DATABASE {{ database_name }};

CREATE OR REPLACE FILE FORMAT CSV_SCHEMA_DETECTION TYPE = CSV PARSE_HEADER = TRUE SKIP_BLANK_LINES = TRUE TRIM_SPACE = TRUE ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE;

CREATE OR REPLACE STAGE DEMOHUB_S3_INT URL = '{{ s3_url }}/' DIRECTORY = (ENABLE = true) COMMENT = 'DemoHub S3 datasets';

