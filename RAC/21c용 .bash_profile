# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH
export PS1='[`echo $ORACLE_SID`:\W]$ '

export ORACLE_BASE=/u01/app/oracle
export ORACLE_SID=orcl
export ORACLE_HOME=/u01/app/oracle/product/21.3.0/dbhome_1
export PATH=$ORACLE_HOME/bin:$PATH
unset LANG
export LANG=ko_KR.UTF-8

alias alert='cd /u01/app/oracle/homes/OraDB21Home1/rdbms/log'
alias net='cd $ORACLE_HOME/network/admin'
alias ss='sqlplus sys/oracle as sysdba'
alias scott='sqlplus scott/tiger'
alias dbs='cd $ORACLE_HOME/dbs'
alias oradata='cd /u01/app/oracle/oradata/orcl/'



NLS_LANG=american_america.we8iso8859p15
NLS_DATE_FORMAT='RRRR/MM/DD:HH24:MI:SS'
export NLS_LANG
export NLS_DATE_FORMAT

alias r='rman target sys/oracle nocatalog'