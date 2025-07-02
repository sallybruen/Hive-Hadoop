set hive.exec.mode.local.auto=true;
use diamonds;
select "Highest Price For " || ' '|| '${hiveconf:arg2} is ' || max(price) from diamondstable where cut = '${hiveconf:arg2}';
select "Lowest Price For " || ' '|| '${hiveconf:arg2} is ' || min(price) from diamondstable where cut = '${hiveconf:arg2}';
select "Number of diamonds for '${hiveconf:arg2}' is " || ' '|| count(cut) from diamondstable where cut like '${hiveconf:arg2}';
