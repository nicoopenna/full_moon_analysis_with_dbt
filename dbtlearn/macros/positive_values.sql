{% test positive_value(model, column_name)%}
SELECT *
FROM {{ model }}
WHERE 1=1
and {{ column_name }} < 1
{% endtest %}