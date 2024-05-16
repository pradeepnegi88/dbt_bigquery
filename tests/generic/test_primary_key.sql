{% test primary_key(model,column_name) %}

with validation as (
  select {{ column_name }} as primary_key,
  count(1) as occurence
  from {{ model }}
  group by 1
)

select * from validation where primary_key is null or occurence > 1


{% endtest %}
