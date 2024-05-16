{%- macro is_weekday(date_column) -%}

extract(dayofweek from date ({{ date_column }})) in (2,3,4,5,6)
  
{%- endmacro -%}