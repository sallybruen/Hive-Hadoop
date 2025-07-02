set hive.exec.mode.local.auto=true;
use diamonds;
select distinct cut from diamondstable;
