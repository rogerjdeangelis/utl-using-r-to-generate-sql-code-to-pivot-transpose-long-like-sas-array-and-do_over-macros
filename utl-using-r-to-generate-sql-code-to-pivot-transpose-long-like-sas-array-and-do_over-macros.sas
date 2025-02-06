%let pgm=utl-using-r-to-generate-sql-code-to-pivot-transpose-long-like-sas-array-and-do_over-macros;

%stop_submission;

Using r to generate sql code to pivot transpose long like sas array and do_over macros

This provides the sas array and do_over functionality in r.
Possible due to a vectorized sprintf function, which was new to me.

excel output(sheet want)
https://tinyurl.com/e2hxvk2n
https://github.com/rogerjdeangelis/utl-using-r-to-generate-sql-code-to-pivot-transpose-long-like-sas-array-and-do_over-macros/blob/main/wantxl.xlsx

github
https://tinyurl.com/z9srrxbr
https://github.com/rogerjdeangelis/utl-using-r-to-generate-sql-code-to-pivot-transpose-long-like-sas-array-and-do_over-macros

stackoverflow R
https://tinyurl.com/455w6ysn
https://stackoverflow.com/questions/2185252/reshaping-data-frame-from-wide-to-long-format

solution by Mark Peterson
https://stackoverflow.com/users/2966222/mark-peterson


    SOLUTIONS

         1 generate code for sas, r, python and excel
         2 sas r python excel copy log code
         3 sas r excel dynamic code

/*               _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
| |_) | | | (_) | |_) | |  __/ | | | | |
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
|_|
*/

/*************************************************************************************************************************/
/*                                  |                                                            |                       */
/*            INPUT                 |               PROCESS                                      |       PROCESS         */
/*            =====                 |               =======                                      |       =======         */
/*                                  |                                                            |                       */
/*                                  |                                                            |                       */
/*      C                           |1 GENERATE CODE FOR SAS, R, PYTHON AND EXCEL                |CODE COUNTRY YEAR VALUE*/
/*      O                           |============================================                |                       */
/*      U     Y    Y    Y    Y    Y |                                                            |  AFG AFGHA Y1950 2024 */
/* C    N     1    1    1    1    1 |yrs_names <- tail(names(have), -2)    * %ARRAY Y1950-Y1954  |  AFG AFGHA Y1951 2135 */
/* O    T     9    9    9    9    9 |                                                            |  AFG AFGHA Y1952 2253 */
/* D    R     5    5    5    5    5 |phrases <- sprintf(                   * SAS %DO_OVER        |  AFG AFGHA Y1953 2355 */
/* E    Y     0    1    2    3    4 |  "Select                             * VETORIZES SORINTF   |  AFG AFGHA Y1954 2455 */
/*                                  |      CODE                                                  |                       */
/*AFG AFGHA 2024 2135 2253 2355 2455|    , COUNTRY                                               |  ALB ALBAN Y1950 8097 */
/*ALB ALBAN 8097 8986 1005 1112 1224|    ,'%s' As yr                                             |  ALB ALBAN Y1951 8986 */
/*                                  |    ,`%s` As val                                            |  ALB ALBAN Y1952 1005 */
/*options validvarname=upcase;      |   from have"                                               |  ALB ALBAN Y1953 1112 */
/*libname sd1 "d:/sd1";             |    ,yrs_names)                                             |  ALB ALBAN Y1954 1224 */
/*data sd1.have;                    |                                                            |                       */
/* input code$ country$ Y1950-Y1954;|phrases <- gsub("\\s+", " ", phrases) * SAS 2 SPACES to ONE |                       */
/*cards4;                           |                                                            |                       */
/*AFG AFGHA 2024 2135 2253 2355 2455|genquery <- paste(phrases                                   |                       */
/*ALB ALBAN 8097 8986 1005 1112 1224|  ,collapse = "\n Union All\n") * DO_OVER BETWEEN OPTION    |                       */
/*;;;;                              |                                                            |                       */
/*run;quit;                         |cat(genquery)                   * PRINT QUERY IN LOG        |                       */
/*                                  |                                                            |                       */
/*                                  |IN THE LOG                                                  |                       */
/*                                  |==========                                                  |                       */
/*                                  |                                                            |                       */
/*                                  |Select CODE,COUNTRY,'Y1950' As Year,`Y1950` As VAL from have|                       */
/*                                  | Union All                                                  |                       */
/*                                  |Select CODE,COUNTRY,'Y1951' As Year,`Y1951` As VAL from have|                       */
/*                                  | Union All                                                  |                       */
/*                                  |Select CODE,COUNTRY,'Y1952' As Year,`Y1952` As VAL from have|                       */
/*                                  | Union All                                                  |                       */
/*                                  |Select CODE,COUNTRY,'Y1953' As Year,`Y1953` As VAL from have|                       */
/*                                  | Union All                                                  |                       */
/*                                  |Select CODE,COUNTRY,'Y1954' As Year,`Y1954` As VAL from have|                       */
/*                                  |                                                            |                       */
/*                                  |NOTE: sprintf is vectorized                                 |                       */
/*                                  |                                                            |                       */
/*                                  |                                                            |                       */
/*                                  |2 SAS R PYTHON EXCEL INSERT CODE ABOVE                      |                       */
/*                                  |======================================                      |                       */
/*                                  |                                                            |                       */
/*                                  |Select CODE,COUNTRY,'Y1950' As Year,`Y1950` As VAL from have|                       */
/*                                  | Union All                                                  |                       */
/*                                  |Select CODE,COUNTRY,'Y1951' As Year,`Y1951` As VAL from have|                       */
/*                                  | Union All                                                  |                       */
/*                                  |Select CODE,COUNTRY,'Y1952' As Year,`Y1952` As VAL from have|                       */
/*                                  | Union All                                                  |                       */
/*                                  |Select CODE,COUNTRY,'Y1953' As Year,`Y1953` As VAL from have|                       */
/*                                  | Union All                                                  |                       */
/*                                  |Select CODE,COUNTRY,'Y1954' As Year,`Y1954` As VAL from have|                       */
/*                                  |                                                            |                       */
/*                                  |                                                            |                       */
/*                                  |                                                            |                       */
/*                                  |3 SAS R EXCEL DYNAMIC (NOT PYTHON)                          |                       */
/*                                  |==================================                          |                       */
/*                                  |                                                            |                       */
/*                                  |SAS DYNAMIC                                                 |                       */
/*                                  |==========                                                  |                       */
/*                                  |                                                            |                       */
/*                                  |%array(_idx,values=0-4);                                    |                       */
/*                                  |                                                            |                       */
/*                                  |proc sql;                                                   |                       */
/*                                  |  create                                                    |                       */
/*                                  |    table want as                                           |                       */
/*                                  |  %do_over(_idx,phrase=%str(                                |                       */
/*                                  |    select code                                             |                       */
/*                                  |     ,country,"Y195?" as year                               |                       */
/*                                  |     ,y195? as value from sd1.have)                         |                       */
/*                                  |    ,between=union all)                                     |                       */
/*                                  |;quit;                                                      |                       */
/*                                  |                                                            |                       */
/*                                  |R DYNAMIC                                                   |                       */
/*                                  |=========                                                   |                       */
/*                                  |                                                            |                       */
/*                                  |yrs_names <- tail(names(have), -2)                          |                       */
/*                                  |                                                            |                       */
/*                                  |phrases <- sprintf(                                         |                       */
/*                                  |  "Select                                                   |                       */
/*                                  |      CODE                                                  |                       */
/*                                  |    , COUNTRY                                               |                       */
/*                                  |    ,'%s' As yr                                             |                       */
/*                                  |    ,`%s` As val                                            |                       */
/*                                  |   from have"                                               |                       */
/*                                  |    ,yrs_names                                              |                       */
/*                                  |    ,yrs_names)                                             |                       */
/*                                  |                                                            |                       */
/*                                  |phrases <- gsub("\\s+", " ", phrases)                       |                       */
/*                                  |                                                            |                       */
/*                                  |genquery <- paste(phrases                                   |                       */
/*                                  |  ,collapse = "\n Union All\n")                             |                       */
/*                                  |                                                            |                       */
/*                                  |sqldf(genquery)                                             |                       */
/*                                  |                                                            |                       */
/*************************************************************************************************************************/


/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

options validvarname=upcase;
libname sd1 "d:/sd1";
data sd1.have;
  input code$ country$ Y1950-Y1954;
cards4;
AFG AFGHA 2024 2135 2253 2355 2455
ALB ALBAN 8097 8986 1005 1112 1224
;;;;
run;quit;

proc print data=sd1.have heading=vertical;
run;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*        C                                                                                                               */
/*        O                                                                                                               */
/*        U     Y    Y    Y    Y    Y                                                                                     */
/*   C    N     1    1    1    1    1                                                                                     */
/*   O    T     9    9    9    9    9                                                                                     */
/*   D    R     5    5    5    5    5                                                                                     */
/*   E    Y     0    1    2    3    4                                                                                     */
/*                                                                                                                        */
/*  AFG AFGHA 2024 2135 2253 2355 2455                                                                                    */
/*  ALB ALBAN 8097 8986 1005 1112 1224                                                                                    */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*                                   _                   _                _
/ |   __ _  ___ _ __   ___ _ __ __ _| |_ ___   ___  __ _| |  ___ ___   __| | ___
| |  / _` |/ _ \ `_ \ / _ \ `__/ _` | __/ _ \ / __|/ _` | | / __/ _ \ / _` |/ _ \
| | | (_| |  __/ | | |  __/ | | (_| | ||  __/ \__ \ (_| | || (_| (_) | (_| |  __/
|_|  \__, |\___|_| |_|\___|_|  \__,_|\__\___| |___/\__, |_| \___\___/ \__,_|\___|
     |___/                                            |_|
*/

%utl_rbeginx;
parmcards4;
library(haven)
library(sqldf)
source("c:/oto/fn_tosas9x.R")
have<-read_sas("d:/sd1/have.sas7bdat")
yrs_names <- tail(names(have), -2)
print(yrs_names)
phrases <- sprintf(
  "Select
      CODE
    , COUNTRY
    ,'%s' As Year
    ,`%s` As VALUE
   from have"
    ,yrs_names
    ,yrs_names)
phrases <- gsub("\\s+", " ", phrases)
genquery <- paste(phrases
  ,collapse = "\n Union All\n")
cat(genquery)
;;;;
%utl_rendx;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*  THIS WILL BE IN THE LOG                                                                                               */
/*                                                                                                                        */
/*  Select CODE , COUNTRY ,'Y1950' As Year ,`Y1950` As VALUE from have                                                    */
/*   Union All                                                                                                            */
/*  Select CODE , COUNTRY ,'Y1951' As Year ,`Y1951` As VALUE from have                                                    */
/*   Union All                                                                                                            */
/*  Select CODE , COUNTRY ,'Y1952' As Year ,`Y1952` As VALUE from have                                                    */
/*   Union All                                                                                                            */
/*  Select CODE , COUNTRY ,'Y1953' As Year ,`Y1953` As VALUE from have                                                    */
/*   Union All                                                                                                            */
/*  Select CODE , COUNTRY ,'Y1954' As Year ,`Y1954` As VALUE from have                                                    */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*___                                      _   _                                    _                                    _
|___ \   ___  __ _ ___   _ __  _ __  _   _| |_| |__   ___  _ __    _____  _____ ___| | _ __ ___   __ _ _ __  _   _  __ _| |
  __) | / __|/ _` / __| | `__|| `_ \| | | | __| `_ \ / _ \| `_ \  / _ \ \/ / __/ _ \ || `_ ` _ \ / _` | `_ \| | | |/ _` | |
 / __/  \__ \ (_| \__ \ | |   | |_) | |_| | |_| | | | (_) | | | ||  __/>  < (_|  __/ || | | | | | (_| | | | | |_| | (_| | |
|_____| |___/\__,_|___/ |_|   | .__/ \__, |\__|_| |_|\___/|_| |_| \___/_/\_\___\___|_||_| |_| |_|\__,_|_| |_|\__,_|\__,_|_|
 ___  __ _ ___                |_|    |___/
/ __|/ _` / __|
\__ \ (_| \__ \
|___/\__,_|___/

*/

proc sql;
  create
    table want as
      Select CODE,COUNTRY,'Y1950' As Year,Y1950 As VALUE from sd1.have
       Union All
      Select CODE,COUNTRY,'Y1951' As Year,Y1951 As VALUE from sd1.have
       Union All
      Select CODE,COUNTRY,'Y1952' As Year,Y1952 As VALUE from sd1.have
       Union All
      Select CODE,COUNTRY,'Y1953' As Year,Y1953 As VALUE from sd1.have
       Union All
      Select CODE,COUNTRY,'Y1954' As Year,Y1954 As VALUE from sd1.have
  order
      by code, year
;quit

/**************************************************************************************************************************/
/*                                                                                                                        */
/*  CODE    COUNTRY     YEAR     VALUE                                                                                    */
/*                                                                                                                        */
/*   AFG      AFGHA     Y1950     2024                                                                                    */
/*   AFG      AFGHA     Y1951     2135                                                                                    */
/*   AFG      AFGHA     Y1952     2253                                                                                    */
/*   AFG      AFGHA     Y1953     2355                                                                                    */
/*   AFG      AFGHA     Y1954     2455                                                                                    */
/*                                                                                                                        */
/*   ALB      ALBAN     Y1950     8097                                                                                    */
/*   ALB      ALBAN     Y1951     8986                                                                                    */
/*   ALB      ALBAN     Y1952     1005                                                                                    */
/*   ALB      ALBAN     Y1953     1112                                                                                    */
/*   ALB      ALBAN     Y1954     1224                                                                                    */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*
 _ __
| `__|
| |
|_|

*/

%utl_rbeginx;
parmcards4;
library(haven)
library(sqldf)
source("c:/oto/fn_tosas9x.R")
have<-read_sas("d:/sd1/have.sas7bdat")
print(have)
want <- sqldf("
   Select CODE,COUNTRY,'Y1950' As Year,Y1950 As VALUE from have
    Union All
   Select CODE,COUNTRY,'Y1951' As Year,Y1951 As VALUE from have
    Union All
   Select CODE,COUNTRY,'Y1952' As Year,Y1952 As VALUE from have
    Union All
   Select CODE,COUNTRY,'Y1953' As Year,Y1953 As VALUE from have
    Union All
   Select CODE,COUNTRY,'Y1954' As Year,Y1954 As VALUE from have
   order by code, year
   ")
want
fn_tosas9x(
      inp    = want
     ,outlib ="d:/sd1/"
     ,outdsn ="want"
     )
;;;;
%utl_rendx;

proc print data=sd1.want;
run;quit;

/**************************************************************************************************************************/
/*                             |                                                                                          */
/*  want                       |  SAS                                                                                     */
/*                             |                                                                                          */
/*   CODE COUNTRY  Year VALUE  |  ROWNAMES    CODE    COUNTRY    YEAR     VALUE                                           */
/*                             |                                                                                          */
/*    AFG   AFGHA Y1950  2024  |      1       AFG      AFGHA     Y1950     2024                                           */
/*    AFG   AFGHA Y1951  2135  |      2       AFG      AFGHA     Y1951     2135                                           */
/*    AFG   AFGHA Y1952  2253  |      3       AFG      AFGHA     Y1952     2253                                           */
/*    AFG   AFGHA Y1953  2355  |      4       AFG      AFGHA     Y1953     2355                                           */
/*    AFG   AFGHA Y1954  2455  |      5       AFG      AFGHA     Y1954     2455                                           */
/*    ALB   ALBAN Y1950  8097  |      6       ALB      ALBAN     Y1950     8097                                           */
/*    ALB   ALBAN Y1951  8986  |      7       ALB      ALBAN     Y1951     8986                                           */
/*    ALB   ALBAN Y1952  1005  |      8       ALB      ALBAN     Y1952     1005                                           */
/*    ALB   ALBAN Y1953  1112  |      9       ALB      ALBAN     Y1953     1112                                           */
/*    ALB   ALBAN Y1954  1224  |     10       ALB      ALBAN     Y1954     1224                                           */
/*                             |                                                                                          */
/**************************************************************************************************************************/

/*           _   _
 _ __  _   _| |_| |__   ___  _ __
| `_ \| | | | __| `_ \ / _ \| `_ \
| |_) | |_| | |_| | | | (_) | | | |
| .__/ \__, |\__|_| |_|\___/|_| |_|
|_|    |___/
*/

proc datasets lib=sd1 nolist nodetails;
 delete pywant;
run;quit;

%utl_pybeginx;
parmcards4;
exec(open('c:/oto/fn_python.py').read());
have,meta = ps.read_sas7bdat('d:/sd1/have.sas7bdat');
want=pdsql("""
   Select CODE,COUNTRY,'Y1950' As Year,Y1950 As VALUE from have \
    Union All                                                   \
   Select CODE,COUNTRY,'Y1951' As Year,Y1951 As VALUE from have \
    Union All                                                   \
   Select CODE,COUNTRY,'Y1952' As Year,Y1952 As VALUE from have \
    Union All                                                   \
   Select CODE,COUNTRY,'Y1953' As Year,Y1953 As VALUE from have \
    Union All                                                   \
   Select CODE,COUNTRY,'Y1954' As Year,Y1954 As VALUE from have \
   order by code, year                                         \
   """)
print(want)
fn_tosas9x(want,outlib='d:/sd1/',outdsn='pywant',timeest=3);
;;;;
%utl_pyendx;

proc print data=sd1.pywant;
run;quit;

/**************************************************************************************************************************/
/*                                |                                                                                       */
/* PYTHON                         |   SAS                                                                                 */
/*                                |                                                                                       */
/*   CODE COUNTRY   Year   VALUE  |   CODE    COUNTRY    YEAR     VALUE                                                   */
/*                                |                                                                                       */
/* 0  AFG   AFGHA  Y1950  2024.0  |   AFG      AFGHA     Y1950     2024                                                   */
/* 1  AFG   AFGHA  Y1951  2135.0  |   AFG      AFGHA     Y1951     2135                                                   */
/* 2  AFG   AFGHA  Y1952  2253.0  |   AFG      AFGHA     Y1952     2253                                                   */
/* 3  AFG   AFGHA  Y1953  2355.0  |   AFG      AFGHA     Y1953     2355                                                   */
/* 4  AFG   AFGHA  Y1954  2455.0  |   AFG      AFGHA     Y1954     2455                                                   */
/* 5  ALB   ALBAN  Y1950  8097.0  |   ALB      ALBAN     Y1950     8097                                                   */
/* 6  ALB   ALBAN  Y1951  8986.0  |   ALB      ALBAN     Y1951     8986                                                   */
/* 7  ALB   ALBAN  Y1952  1005.0  |   ALB      ALBAN     Y1952     1005                                                   */
/* 8  ALB   ALBAN  Y1953  1112.0  |   ALB      ALBAN     Y1953     1112                                                   */
/* 9  ALB   ALBAN  Y1954  1224.0  |   ALB      ALBAN     Y1954     1224                                                   */
/*                                |                                                                                       */
/**************************************************************************************************************************/

/*                 _
  _____  _____ ___| |
 / _ \ \/ / __/ _ \ |
|  __/>  < (_|  __/ |
 \___/_/\_\___\___|_|

*/

%utlfkil(d:/xls/wantxl.xlsx);

%utl_rbeginx;
parmcards4;
library(openxlsx)
library(sqldf)
library(haven)
have<-read_sas("d:/sd1/have.sas7bdat")
have
wb <- createWorkbook()
addWorksheet(wb, "have")
writeData(wb, sheet = "have", x = have)
saveWorkbook(
    wb
   ,"d:/xls/wantxl.xlsx"
   ,overwrite=TRUE)
;;;;
%utl_rendx;


%utl_rbeginx;
parmcards4;
library(openxlsx)
library(sqldf)
 wb<-loadWorkbook("d:/xls/wantxl.xlsx")
 have<-read.xlsx(wb,"have")
 have
 addWorksheet(wb, "want")
 want<-sqldf("
   Select CODE,COUNTRY,'Y1950' As Year,Y1950 As VALUE from have
    Union All
   Select CODE,COUNTRY,'Y1951' As Year,Y1951 As VALUE from have
    Union All
   Select CODE,COUNTRY,'Y1952' As Year,Y1952 As VALUE from have
    Union All
   Select CODE,COUNTRY,'Y1953' As Year,Y1953 As VALUE from have
    Union All
   Select CODE,COUNTRY,'Y1954' As Year,Y1954 As VALUE from have
   order by code, year
   ")
 print(want)
 writeData(wb,sheet="want",x=want)
 saveWorkbook(
     wb
    ,"d:/xls/wantxl.xlsx"
    ,overwrite=TRUE)
;;;;
%utl_rendx;

/*____       _                             _
|___ /    __| |_   _ _ __   __ _ _ __ ___ (_) ___   ___  __ _ ___   _ __
  |_ \   / _` | | | | `_ \ / _` | `_ ` _ \| |/ __| / __|/ _` / __| | `__|
 ___) | | (_| | |_| | | | | (_| | | | | | | | (__  \__ \ (_| \__ \ | |
|____/   \__,_|\__, |_| |_|\__,_|_| |_| |_|_|\___| |___/\__,_|___/ |_|
 ___  __ _ ___ |___/
/ __|/ _` / __|
\__ \ (_| \__ \
|___/\__,_|___/

*/

%array(_idx,values=0-4);

proc sql;
  create
    table want as
    %do_over(_idx,phrase=%str(
      select code,country,"195?" as year,y195? as value from sd1.have)
    ,between=union all)
  order
     by code, year
;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*   CODE    COUNTRY    YEAR    VALUE                                                                                     */
/*                                                                                                                        */
/*   AFG      AFGHA     1950     2024                                                                                     */
/*   AFG      AFGHA     1951     2135                                                                                     */
/*   AFG      AFGHA     1952     2253                                                                                     */
/*   AFG      AFGHA     1953     2355                                                                                     */
/*   AFG      AFGHA     1954     2455                                                                                     */
/*   ALB      ALBAN     1950     8097                                                                                     */
/*   ALB      ALBAN     1951     8986                                                                                     */
/*   ALB      ALBAN     1952     1005                                                                                     */
/*   ALB      ALBAN     1953     1112                                                                                     */
/*   ALB      ALBAN     1954     1224                                                                                     */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*
 _ __
| `__|
| |
|_|

*/

%utl_rbeginx;
parmcards4;
library(haven)
library(sqldf)
source("c:/oto/fn_tosas9x.R")
have<-read_sas("d:/sd1/have.sas7bdat")
yrs_names <- tail(names(have), -2)
print(yrs_names)
phrases <- sprintf(
  "Select
      CODE
    , COUNTRY
    ,'%s' As Year
    ,`%s` As VALUE
   from have"
    ,yrs_names
    ,yrs_names)
phrases <- gsub("\\s+", " ", phrases)
genquery <- paste(phrases
  ,collapse = "\n Union All\n")
cat(genquery)
want<-sqldf(genquery)
want
fn_tosas9x(
      inp    = want
     ,outlib ="d:/sd1/"
     ,outdsn ="want"
     )
;;;;
%utl_rendx;

proc print data=sd1.want;
run;quit;

/**************************************************************************************************************************/
/*                             |                                                                                          */
/*  want                       | SAS                                                                                      */
/*                             |                                                                                          */
/*   CODE COUNTRY  Year VALUE  | ROWNAMES    CODE    COUNTRY    YEAR     VALUE                                            */
/*                             |                                                                                          */
/*    AFG   AFGHA Y1950  2024  |     1       AFG      AFGHA     Y1950     2024                                            */
/*    ALB   ALBAN Y1950  8097  |     2       ALB      ALBAN     Y1950     8097                                            */
/*    AFG   AFGHA Y1951  2135  |     3       AFG      AFGHA     Y1951     2135                                            */
/*    ALB   ALBAN Y1951  8986  |     4       ALB      ALBAN     Y1951     8986                                            */
/*    AFG   AFGHA Y1952  2253  |     5       AFG      AFGHA     Y1952     2253                                            */
/*    ALB   ALBAN Y1952  1005  |     6       ALB      ALBAN     Y1952     1005                                            */
/*    AFG   AFGHA Y1953  2355  |     7       AFG      AFGHA     Y1953     2355                                            */
/*    ALB   ALBAN Y1953  1112  |     8       ALB      ALBAN     Y1953     1112                                            */
/*    AFG   AFGHA Y1954  2455  |     9       AFG      AFGHA     Y1954     2455                                            */
/*    ALB   ALBAN Y1954  1224  |    10       ALB      ALBAN     Y1954     1224                                            */
/*                             |                                                                                          */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/

