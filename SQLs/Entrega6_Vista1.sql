Create view Vista_Visitantes as
select *
from visitantes
where fecha Between '2024-04-10' AND '2024-04-16';