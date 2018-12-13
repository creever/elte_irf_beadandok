--------------------------------------------------------
--  File created - szombat-november-24-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CUSTOMER_TRANSACTIONS
--------------------------------------------------------

  CREATE TABLE "AWUD3U"."CUSTOMER_TRANSACTIONS" 
   (	"ID" NUMBER(*,0), 
	"AMOUNT" NUMBER(13,2), 
	"CUSTOMER_ID" NUMBER(*,0), 
	"CREATED_AT" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CUSTOMERS
--------------------------------------------------------

  CREATE TABLE "AWUD3U"."CUSTOMERS" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(128 BYTE), 
	"EMAIL" VARCHAR2(128 BYTE), 
	"PHONE_NUMBER" VARCHAR2(128 BYTE), 
	"BALANCE" NUMBER, 
	"DISCOUNT_GROUP" VARCHAR2(10 BYTE), 
	"SALES_AREA" VARCHAR2(32 BYTE), 
	"CUSTOMER_AREA" VARCHAR2(32 BYTE), 
	"UPDATED_AT" DATE, 
	"CREATED_AT" DATE, 
	"ADDRESS" VARCHAR2(128 BYTE), 
	"SHIPPING_COMMENT" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ORDER_PRODUCTS
--------------------------------------------------------

  CREATE TABLE "AWUD3U"."ORDER_PRODUCTS" 
   (	"ID" NUMBER(*,0), 
	"ORDER_ID" NUMBER(*,0), 
	"PRODUCT_ID" NUMBER(*,0), 
	"QUANTITY" NUMBER(*,0), 
	"PRICE" NUMBER(13,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "AWUD3U"."ORDERS" 
   (	"ID" NUMBER(*,0), 
	"CUSTOMER_ID" NUMBER(*,0), 
	"ORDER_IDENTIFIER" VARCHAR2(64 BYTE), 
	"CREATED_AT" DATE, 
	"INVOICE_ISSUED_AT" DATE, 
	"PAYED_AT" DATE, 
	"CANCELLED_AT" DATE, 
	"SHIPPED_AT" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCT_CATEGORIES
--------------------------------------------------------

  CREATE TABLE "AWUD3U"."PRODUCT_CATEGORIES" 
   (	"ID" NUMBER(*,0), 
	"TITLE" VARCHAR2(255 BYTE), 
	"SKU" VARCHAR2(32 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCT_STOCK
--------------------------------------------------------

  CREATE TABLE "AWUD3U"."PRODUCT_STOCK" 
   (	"ID" NUMBER(*,0), 
	"WHOLESALER_ID" NUMBER(*,0), 
	"PRODUCT_ID" NUMBER(*,0), 
	"QUANTITY" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCTS
--------------------------------------------------------

  CREATE TABLE "AWUD3U"."PRODUCTS" 
   (	"ID" NUMBER(*,0), 
	"SKU" VARCHAR2(32 BYTE), 
	"TITLE" VARCHAR2(255 BYTE), 
	"DESCRIPTION" CLOB, 
	"PRICE" NUMBER(13,2), 
	"PRICE_A" NUMBER(13,2), 
	"PRICE_B" NUMBER(13,2), 
	"PRICE_C" NUMBER(13,2), 
	"PRICE_D" NUMBER(13,2), 
	"PRODUCT_CATEGORY_ID" NUMBER(*,0), 
	"AVAILABILITY" CHAR(1 BYTE), 
	"CREATED_AT" DATE, 
	"UPDATED_AT" DATE, 
	"UNIT" VARCHAR2(32 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("DESCRIPTION") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table WHOLESALE_ORDER_PRODUCTS
--------------------------------------------------------

  CREATE TABLE "AWUD3U"."WHOLESALE_ORDER_PRODUCTS" 
   (	"ID" NUMBER(*,0), 
	"PRODUCT_ID" NUMBER(*,0), 
	"QUANTITY" NUMBER(*,0), 
	"PRICE" NUMBER(13,2), 
	"WHOLESALER_ORDER_ID" NUMBER(*,0), 
	"ORDER_PRODUCT_ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table WHOLESALE_ORDERS
--------------------------------------------------------

  CREATE TABLE "AWUD3U"."WHOLESALE_ORDERS" 
   (	"ID" NUMBER(*,0), 
	"WHOLESALER_ID" NUMBER(*,0), 
	"ORDER_IDENTIFIER" VARCHAR2(64 BYTE), 
	"CREATED_AT" DATE, 
	"INVOICE_ISSUED_AT" DATE, 
	"PAYED_AT" DATE, 
	"CANCELLED_AT" DATE, 
	"SCHEDULED_FOR" DATE, 
	"ARRIVED_AT" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table WHOLESALERS
--------------------------------------------------------

  CREATE TABLE "AWUD3U"."WHOLESALERS" 
   (	"ID" NUMBER(*,0), 
	"TITLE" VARCHAR2(255 BYTE), 
	"ADDRESS" VARCHAR2(128 BYTE), 
	"PHONE_NUMBER" VARCHAR2(32 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into AWUD3U.CUSTOMER_TRANSACTIONS
SET DEFINE OFF;
Insert into AWUD3U.CUSTOMER_TRANSACTIONS (ID,AMOUNT,CUSTOMER_ID,CREATED_AT) values ('1','10000','1',null);
Insert into AWUD3U.CUSTOMER_TRANSACTIONS (ID,AMOUNT,CUSTOMER_ID,CREATED_AT) values ('2','12000','2',null);
Insert into AWUD3U.CUSTOMER_TRANSACTIONS (ID,AMOUNT,CUSTOMER_ID,CREATED_AT) values ('3','14000','3',null);
Insert into AWUD3U.CUSTOMER_TRANSACTIONS (ID,AMOUNT,CUSTOMER_ID,CREATED_AT) values ('4','10000','4',null);
Insert into AWUD3U.CUSTOMER_TRANSACTIONS (ID,AMOUNT,CUSTOMER_ID,CREATED_AT) values ('5','13000','5',null);
REM INSERTING into AWUD3U.CUSTOMERS
SET DEFINE OFF;
Insert into AWUD3U.CUSTOMERS (ID,NAME,EMAIL,PHONE_NUMBER,BALANCE,DISCOUNT_GROUP,SALES_AREA,CUSTOMER_AREA,UPDATED_AT,CREATED_AT,ADDRESS,SHIPPING_COMMENT) values ('1','Vev�1',null,'111111','11000','A','K�rzet1','1',null,null,'Vev�c�m1','Kulcs a l�bt�rl� alatt');
Insert into AWUD3U.CUSTOMERS (ID,NAME,EMAIL,PHONE_NUMBER,BALANCE,DISCOUNT_GROUP,SALES_AREA,CUSTOMER_AREA,UPDATED_AT,CREATED_AT,ADDRESS,SHIPPING_COMMENT) values ('2','Vev�2',null,'222222','12000','A','K�rzet1','1',null,null,'Vev�c�m2','Balra az els� ajt� az udvarban');
Insert into AWUD3U.CUSTOMERS (ID,NAME,EMAIL,PHONE_NUMBER,BALANCE,DISCOUNT_GROUP,SALES_AREA,CUSTOMER_AREA,UPDATED_AT,CREATED_AT,ADDRESS,SHIPPING_COMMENT) values ('3','Vev�3',null,'333333','13000','B','K�rzet1','2',null,null,'Vev�c�m3',null);
Insert into AWUD3U.CUSTOMERS (ID,NAME,EMAIL,PHONE_NUMBER,BALANCE,DISCOUNT_GROUP,SALES_AREA,CUSTOMER_AREA,UPDATED_AT,CREATED_AT,ADDRESS,SHIPPING_COMMENT) values ('4','Vev�4',null,'444444','14000','B','K�rzet1','2',null,null,'Vev�c�m4','Legals� cseng�');
Insert into AWUD3U.CUSTOMERS (ID,NAME,EMAIL,PHONE_NUMBER,BALANCE,DISCOUNT_GROUP,SALES_AREA,CUSTOMER_AREA,UPDATED_AT,CREATED_AT,ADDRESS,SHIPPING_COMMENT) values ('5','Vev�5',null,'555555','15000','B','K�rzet1','2',null,null,'Vev�c�m5',null);
REM INSERTING into AWUD3U.ORDER_PRODUCTS
SET DEFINE OFF;
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('1','1','1','10',null);
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('2','1','2','20',null);
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('3','1','3','5',null);
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('4','2','1','10',null);
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('5','2','5','14',null);
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('6','2','3','5',null);
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('7','2','4','6',null);
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('8','3','1','10',null);
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('9','3','5','14',null);
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('10','3','3','5',null);
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('11','3','6','6',null);
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('12','4','1','12',null);
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('13','4','5','11',null);
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('14','4','2','20',null);
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('15','4','4','16',null);
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('16','4','6','8',null);
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('17','5','1','11',null);
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('18','5','3','17',null);
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('19','5','6','5',null);
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('20','5','4','26',null);
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('21','6','2','10',null);
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('22','6','5','14',null);
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('23','6','3','5',null);
Insert into AWUD3U.ORDER_PRODUCTS (ID,ORDER_ID,PRODUCT_ID,QUANTITY,PRICE) values ('24','6','4','6',null);
REM INSERTING into AWUD3U.ORDERS
SET DEFINE OFF;
Insert into AWUD3U.ORDERS (ID,CUSTOMER_ID,ORDER_IDENTIFIER,CREATED_AT,INVOICE_ISSUED_AT,PAYED_AT,CANCELLED_AT,SHIPPED_AT) values ('1','1','1',to_date('17-JAN-23','RR-MON-DD'),null,null,null,null);
Insert into AWUD3U.ORDERS (ID,CUSTOMER_ID,ORDER_IDENTIFIER,CREATED_AT,INVOICE_ISSUED_AT,PAYED_AT,CANCELLED_AT,SHIPPED_AT) values ('2','2','2',to_date('17-JAN-23','RR-MON-DD'),null,null,null,null);
Insert into AWUD3U.ORDERS (ID,CUSTOMER_ID,ORDER_IDENTIFIER,CREATED_AT,INVOICE_ISSUED_AT,PAYED_AT,CANCELLED_AT,SHIPPED_AT) values ('3','3','3',to_date('17-JAN-23','RR-MON-DD'),null,null,null,null);
Insert into AWUD3U.ORDERS (ID,CUSTOMER_ID,ORDER_IDENTIFIER,CREATED_AT,INVOICE_ISSUED_AT,PAYED_AT,CANCELLED_AT,SHIPPED_AT) values ('4','3','4',to_date('17-JAN-24','RR-MON-DD'),null,null,null,null);
Insert into AWUD3U.ORDERS (ID,CUSTOMER_ID,ORDER_IDENTIFIER,CREATED_AT,INVOICE_ISSUED_AT,PAYED_AT,CANCELLED_AT,SHIPPED_AT) values ('5','4','5',to_date('17-JAN-24','RR-MON-DD'),null,null,null,null);
Insert into AWUD3U.ORDERS (ID,CUSTOMER_ID,ORDER_IDENTIFIER,CREATED_AT,INVOICE_ISSUED_AT,PAYED_AT,CANCELLED_AT,SHIPPED_AT) values ('6','4','6',to_date('17-JAN-24','RR-MON-DD'),null,null,null,null);
REM INSERTING into AWUD3U.PRODUCT_CATEGORIES
SET DEFINE OFF;
Insert into AWUD3U.PRODUCT_CATEGORIES (ID,TITLE,SKU) values ('1','Konzerv','1');
Insert into AWUD3U.PRODUCT_CATEGORIES (ID,TITLE,SKU) values ('2','�d�t�','2');
Insert into AWUD3U.PRODUCT_CATEGORIES (ID,TITLE,SKU) values ('3','Egy�b','3');
REM INSERTING into AWUD3U.PRODUCT_STOCK
SET DEFINE OFF;
Insert into AWUD3U.PRODUCT_STOCK (ID,WHOLESALER_ID,PRODUCT_ID,QUANTITY) values ('1','1','1','140');
Insert into AWUD3U.PRODUCT_STOCK (ID,WHOLESALER_ID,PRODUCT_ID,QUANTITY) values ('2','2','1','150');
Insert into AWUD3U.PRODUCT_STOCK (ID,WHOLESALER_ID,PRODUCT_ID,QUANTITY) values ('3','1','2','190');
Insert into AWUD3U.PRODUCT_STOCK (ID,WHOLESALER_ID,PRODUCT_ID,QUANTITY) values ('4','3','2','200');
Insert into AWUD3U.PRODUCT_STOCK (ID,WHOLESALER_ID,PRODUCT_ID,QUANTITY) values ('5','2','3','260');
Insert into AWUD3U.PRODUCT_STOCK (ID,WHOLESALER_ID,PRODUCT_ID,QUANTITY) values ('6','4','3','270');
Insert into AWUD3U.PRODUCT_STOCK (ID,WHOLESALER_ID,PRODUCT_ID,QUANTITY) values ('7','3','4','80');
Insert into AWUD3U.PRODUCT_STOCK (ID,WHOLESALER_ID,PRODUCT_ID,QUANTITY) values ('8','4','4','90');
Insert into AWUD3U.PRODUCT_STOCK (ID,WHOLESALER_ID,PRODUCT_ID,QUANTITY) values ('9','1','5','120');
Insert into AWUD3U.PRODUCT_STOCK (ID,WHOLESALER_ID,PRODUCT_ID,QUANTITY) values ('10','4','5','140');
Insert into AWUD3U.PRODUCT_STOCK (ID,WHOLESALER_ID,PRODUCT_ID,QUANTITY) values ('11','2','6','300');
Insert into AWUD3U.PRODUCT_STOCK (ID,WHOLESALER_ID,PRODUCT_ID,QUANTITY) values ('12','3','6','320');
REM INSERTING into AWUD3U.PRODUCTS
SET DEFINE OFF;
Insert into AWUD3U.PRODUCTS (ID,SKU,TITLE,PRICE,PRICE_A,PRICE_B,PRICE_C,PRICE_D,PRODUCT_CATEGORY_ID,AVAILABILITY,CREATED_AT,UPDATED_AT,UNIT) values ('1','1','Almal�','200','190','180','170','160','2',null,null,null,'liter');
Insert into AWUD3U.PRODUCTS (ID,SKU,TITLE,PRICE,PRICE_A,PRICE_B,PRICE_C,PRICE_D,PRODUCT_CATEGORY_ID,AVAILABILITY,CREATED_AT,UPDATED_AT,UNIT) values ('2','2','Megyl�','250','240','230','220','210','2',null,null,null,'liter');
Insert into AWUD3U.PRODUCTS (ID,SKU,TITLE,PRICE,PRICE_A,PRICE_B,PRICE_C,PRICE_D,PRODUCT_CATEGORY_ID,AVAILABILITY,CREATED_AT,UPDATED_AT,UNIT) values ('3','3','Babkonzerv','350','340','330','320','310','1',null,null,null,'doboz');
Insert into AWUD3U.PRODUCTS (ID,SKU,TITLE,PRICE,PRICE_A,PRICE_B,PRICE_C,PRICE_D,PRODUCT_CATEGORY_ID,AVAILABILITY,CREATED_AT,UPDATED_AT,UNIT) values ('4','4','Kukorica','150','140','130','120','110','1',null,null,null,'doboz');
Insert into AWUD3U.PRODUCTS (ID,SKU,TITLE,PRICE,PRICE_A,PRICE_B,PRICE_C,PRICE_D,PRODUCT_CATEGORY_ID,AVAILABILITY,CREATED_AT,UPDATED_AT,UNIT) values ('5','5','Cukor','200','190','180','170','160','3',null,null,null,'kg');
Insert into AWUD3U.PRODUCTS (ID,SKU,TITLE,PRICE,PRICE_A,PRICE_B,PRICE_C,PRICE_D,PRODUCT_CATEGORY_ID,AVAILABILITY,CREATED_AT,UPDATED_AT,UNIT) values ('6','6','Rizs','400','390','380','370','360','3',null,null,null,'kg');
REM INSERTING into AWUD3U.WHOLESALE_ORDER_PRODUCTS
SET DEFINE OFF;
Insert into AWUD3U.WHOLESALE_ORDER_PRODUCTS (ID,PRODUCT_ID,QUANTITY,PRICE,WHOLESALER_ORDER_ID,ORDER_PRODUCT_ID) values ('4','1','10','100','1','1');
Insert into AWUD3U.WHOLESALE_ORDER_PRODUCTS (ID,PRODUCT_ID,QUANTITY,PRICE,WHOLESALER_ORDER_ID,ORDER_PRODUCT_ID) values ('5','2','20','100','1','2');
Insert into AWUD3U.WHOLESALE_ORDER_PRODUCTS (ID,PRODUCT_ID,QUANTITY,PRICE,WHOLESALER_ORDER_ID,ORDER_PRODUCT_ID) values ('6','5','11','100','1','13');
Insert into AWUD3U.WHOLESALE_ORDER_PRODUCTS (ID,PRODUCT_ID,QUANTITY,PRICE,WHOLESALER_ORDER_ID,ORDER_PRODUCT_ID) values ('7','3','5','100','2','3');
Insert into AWUD3U.WHOLESALE_ORDER_PRODUCTS (ID,PRODUCT_ID,QUANTITY,PRICE,WHOLESALER_ORDER_ID,ORDER_PRODUCT_ID) values ('8','6','8','100','2','16');
Insert into AWUD3U.WHOLESALE_ORDER_PRODUCTS (ID,PRODUCT_ID,QUANTITY,PRICE,WHOLESALER_ORDER_ID,ORDER_PRODUCT_ID) values ('9','4','16','100','3','15');
REM INSERTING into AWUD3U.WHOLESALE_ORDERS
SET DEFINE OFF;
Insert into AWUD3U.WHOLESALE_ORDERS (ID,WHOLESALER_ID,ORDER_IDENTIFIER,CREATED_AT,INVOICE_ISSUED_AT,PAYED_AT,CANCELLED_AT,SCHEDULED_FOR,ARRIVED_AT) values ('1','1','SZR1',to_date('18-NOV-05','RR-MON-DD'),null,null,null,null,to_date('18-NOV-08','RR-MON-DD'));
Insert into AWUD3U.WHOLESALE_ORDERS (ID,WHOLESALER_ID,ORDER_IDENTIFIER,CREATED_AT,INVOICE_ISSUED_AT,PAYED_AT,CANCELLED_AT,SCHEDULED_FOR,ARRIVED_AT) values ('2','2','SZR2',to_date('18-NOV-05','RR-MON-DD'),null,null,null,null,to_date('18-NOV-10','RR-MON-DD'));
Insert into AWUD3U.WHOLESALE_ORDERS (ID,WHOLESALER_ID,ORDER_IDENTIFIER,CREATED_AT,INVOICE_ISSUED_AT,PAYED_AT,CANCELLED_AT,SCHEDULED_FOR,ARRIVED_AT) values ('3','4','SZR3',to_date('18-NOV-05','RR-MON-DD'),null,null,null,null,null);
REM INSERTING into AWUD3U.WHOLESALERS
SET DEFINE OFF;
Insert into AWUD3U.WHOLESALERS (ID,TITLE,ADDRESS,PHONE_NUMBER) values ('1','Sz�ll�t�1','Sz�ll�t�c�m1','1555555');
Insert into AWUD3U.WHOLESALERS (ID,TITLE,ADDRESS,PHONE_NUMBER) values ('2','Sz�ll�t�2','Sz�ll�t�c�m2','2555555');
Insert into AWUD3U.WHOLESALERS (ID,TITLE,ADDRESS,PHONE_NUMBER) values ('3','Sz�ll�t�3','Sz�ll�t�c�m3','3555555');
Insert into AWUD3U.WHOLESALERS (ID,TITLE,ADDRESS,PHONE_NUMBER) values ('4','Sz�ll�t�4','Sz�ll�t�c�m4','4555555');
--------------------------------------------------------
--  DDL for Index CUSTOMERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AWUD3U"."CUSTOMERS_PK" ON "AWUD3U"."CUSTOMERS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ORDER_PRODUCTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AWUD3U"."ORDER_PRODUCTS_PK" ON "AWUD3U"."ORDER_PRODUCTS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ORDERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AWUD3U"."ORDERS_PK" ON "AWUD3U"."ORDERS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ORDERS__UN
--------------------------------------------------------

  CREATE UNIQUE INDEX "AWUD3U"."ORDERS__UN" ON "AWUD3U"."ORDERS" ("ORDER_IDENTIFIER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRODUCT_CATEGORIES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AWUD3U"."PRODUCT_CATEGORIES_PK" ON "AWUD3U"."PRODUCT_CATEGORIES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRODUCT_CATEGORIES__UN
--------------------------------------------------------

  CREATE UNIQUE INDEX "AWUD3U"."PRODUCT_CATEGORIES__UN" ON "AWUD3U"."PRODUCT_CATEGORIES" ("SKU", "TITLE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRODUCT_STOCK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AWUD3U"."PRODUCT_STOCK_PK" ON "AWUD3U"."PRODUCT_STOCK" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRODUCTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AWUD3U"."PRODUCTS_PK" ON "AWUD3U"."PRODUCTS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRODUCTS__UN
--------------------------------------------------------

  CREATE UNIQUE INDEX "AWUD3U"."PRODUCTS__UN" ON "AWUD3U"."PRODUCTS" ("SKU") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index WHOLESALE_ORDER_PRODUCTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AWUD3U"."WHOLESALE_ORDER_PRODUCTS_PK" ON "AWUD3U"."WHOLESALE_ORDER_PRODUCTS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index WHOLESALE_ORDERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AWUD3U"."WHOLESALE_ORDERS_PK" ON "AWUD3U"."WHOLESALE_ORDERS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index WHOLESALE_ORDERS__UN
--------------------------------------------------------

  CREATE UNIQUE INDEX "AWUD3U"."WHOLESALE_ORDERS__UN" ON "AWUD3U"."WHOLESALE_ORDERS" ("ORDER_IDENTIFIER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index WHOLESALERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AWUD3U"."WHOLESALERS_PK" ON "AWUD3U"."WHOLESALERS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger FKNTM_CUSTOMER_TRANSACTIONS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "AWUD3U"."FKNTM_CUSTOMER_TRANSACTIONS" BEFORE
    UPDATE OF customer_id ON customer_transactions
BEGIN
    raise_application_error(-20225,'Non Transferable FK constraint  on table customer_transactions is violated');
END;

/
ALTER TRIGGER "AWUD3U"."FKNTM_CUSTOMER_TRANSACTIONS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CUSTOMER_TRANSACTIONS_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "AWUD3U"."CUSTOMER_TRANSACTIONS_ID_TRG" BEFORE
    INSERT ON customer_transactions
    FOR EACH ROW
     WHEN ( new.id IS NULL ) BEGIN
    :new.id := customer_transactions_id_seq.nextval;
END;

/
ALTER TRIGGER "AWUD3U"."CUSTOMER_TRANSACTIONS_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CUSTOMERS_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "AWUD3U"."CUSTOMERS_ID_TRG" BEFORE
    INSERT ON customers
    FOR EACH ROW
     WHEN ( new.id IS NULL ) BEGIN
    :new.id := customers_id_seq.nextval;
END;

/
ALTER TRIGGER "AWUD3U"."CUSTOMERS_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ORDER_PRODUCTS_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "AWUD3U"."ORDER_PRODUCTS_ID_TRG" BEFORE
    INSERT ON order_products
    FOR EACH ROW
     WHEN ( new.id IS NULL ) BEGIN
    :new.id := order_products_id_seq.nextval;
END;

/
ALTER TRIGGER "AWUD3U"."ORDER_PRODUCTS_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger FKNTM_ORDERS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "AWUD3U"."FKNTM_ORDERS" BEFORE
    UPDATE OF customer_id ON orders
BEGIN
    raise_application_error(-20225,'Non Transferable FK constraint  on table orders is violated');
END;

/
ALTER TRIGGER "AWUD3U"."FKNTM_ORDERS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ORDERS_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "AWUD3U"."ORDERS_ID_TRG" BEFORE
    INSERT ON orders
    FOR EACH ROW
     WHEN ( new.id IS NULL ) BEGIN
    :new.id := orders_id_seq.nextval;
END;

/
ALTER TRIGGER "AWUD3U"."ORDERS_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PRODUCT_CATEGORIES_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "AWUD3U"."PRODUCT_CATEGORIES_ID_TRG" BEFORE
    INSERT ON product_categories
    FOR EACH ROW
     WHEN ( new.id IS NULL ) BEGIN
    :new.id := product_categories_id_seq.nextval;
END;

/
ALTER TRIGGER "AWUD3U"."PRODUCT_CATEGORIES_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PRODUCT_STOCK_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "AWUD3U"."PRODUCT_STOCK_ID_TRG" BEFORE
    INSERT ON product_stock
    FOR EACH ROW
     WHEN ( new.id IS NULL ) BEGIN
    :new.id := product_stock_id_seq.nextval;
END;

/
ALTER TRIGGER "AWUD3U"."PRODUCT_STOCK_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PRODUCTS_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "AWUD3U"."PRODUCTS_ID_TRG" BEFORE
    INSERT ON products
    FOR EACH ROW
     WHEN ( new.id IS NULL ) BEGIN
    :new.id := products_id_seq.nextval;
END;

/
ALTER TRIGGER "AWUD3U"."PRODUCTS_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger WHOLESALE_ORDER_PRODUCTS_ID
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "AWUD3U"."WHOLESALE_ORDER_PRODUCTS_ID" BEFORE
    INSERT ON wholesale_order_products
    FOR EACH ROW
     WHEN ( new.id IS NULL ) BEGIN
    :new.id := wholesale_order_products_id.nextval;
END;

/
ALTER TRIGGER "AWUD3U"."WHOLESALE_ORDER_PRODUCTS_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger WHOLESALE_ORDERS_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "AWUD3U"."WHOLESALE_ORDERS_ID_TRG" BEFORE
    INSERT ON wholesale_orders
    FOR EACH ROW
     WHEN ( new.id IS NULL ) BEGIN
    :new.id := wholesale_orders_id_seq.nextval;
END;


/
ALTER TRIGGER "AWUD3U"."WHOLESALE_ORDERS_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger FKNTM_WHOLESALE_ORDERS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "AWUD3U"."FKNTM_WHOLESALE_ORDERS" BEFORE
    UPDATE OF wholesaler_id ON wholesale_orders
BEGIN
    raise_application_error(-20225,'Non Transferable FK constraint  on table wholesale_orders is violated');
END;

/
ALTER TRIGGER "AWUD3U"."FKNTM_WHOLESALE_ORDERS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger WHOLESALERS_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "AWUD3U"."WHOLESALERS_ID_TRG" BEFORE
    INSERT ON wholesalers
    FOR EACH ROW
     WHEN ( new.id IS NULL ) BEGIN
    :new.id := wholesalers_id_seq.nextval;
END;

/
ALTER TRIGGER "AWUD3U"."WHOLESALERS_ID_TRG" ENABLE;
--------------------------------------------------------
--  Constraints for Table CUSTOMER_TRANSACTIONS
--------------------------------------------------------

  ALTER TABLE "AWUD3U"."CUSTOMER_TRANSACTIONS" MODIFY ("CUSTOMER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "AWUD3U"."CUSTOMERS" ADD CONSTRAINT "CUSTOMERS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "AWUD3U"."CUSTOMERS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "AWUD3U"."CUSTOMERS" MODIFY ("DISCOUNT_GROUP" NOT NULL ENABLE);
  ALTER TABLE "AWUD3U"."CUSTOMERS" MODIFY ("SALES_AREA" NOT NULL ENABLE);
  ALTER TABLE "AWUD3U"."CUSTOMERS" MODIFY ("CUSTOMER_AREA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORDER_PRODUCTS
--------------------------------------------------------

  ALTER TABLE "AWUD3U"."ORDER_PRODUCTS" ADD CONSTRAINT "ORDER_PRODUCTS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "AWUD3U"."ORDER_PRODUCTS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "AWUD3U"."ORDER_PRODUCTS" MODIFY ("ORDER_ID" NOT NULL ENABLE);
  ALTER TABLE "AWUD3U"."ORDER_PRODUCTS" MODIFY ("PRODUCT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "AWUD3U"."ORDERS" ADD CONSTRAINT "ORDERS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "AWUD3U"."ORDERS" ADD CONSTRAINT "ORDERS__UN" UNIQUE ("ORDER_IDENTIFIER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "AWUD3U"."ORDERS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "AWUD3U"."ORDERS" MODIFY ("CUSTOMER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCT_CATEGORIES
--------------------------------------------------------

  ALTER TABLE "AWUD3U"."PRODUCT_CATEGORIES" ADD CONSTRAINT "PRODUCT_CATEGORIES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "AWUD3U"."PRODUCT_CATEGORIES" ADD CONSTRAINT "PRODUCT_CATEGORIES__UN" UNIQUE ("SKU", "TITLE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "AWUD3U"."PRODUCT_CATEGORIES" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCT_STOCK
--------------------------------------------------------

  ALTER TABLE "AWUD3U"."PRODUCT_STOCK" ADD CONSTRAINT "PRODUCT_STOCK_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "AWUD3U"."PRODUCT_STOCK" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "AWUD3U"."PRODUCT_STOCK" MODIFY ("WHOLESALER_ID" NOT NULL ENABLE);
  ALTER TABLE "AWUD3U"."PRODUCT_STOCK" MODIFY ("PRODUCT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCTS
--------------------------------------------------------

  ALTER TABLE "AWUD3U"."PRODUCTS" ADD CONSTRAINT "PRODUCTS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "AWUD3U"."PRODUCTS" ADD CONSTRAINT "PRODUCTS__UN" UNIQUE ("SKU")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "AWUD3U"."PRODUCTS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table WHOLESALE_ORDER_PRODUCTS
--------------------------------------------------------

  ALTER TABLE "AWUD3U"."WHOLESALE_ORDER_PRODUCTS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "AWUD3U"."WHOLESALE_ORDER_PRODUCTS" MODIFY ("PRODUCT_ID" NOT NULL ENABLE);
  ALTER TABLE "AWUD3U"."WHOLESALE_ORDER_PRODUCTS" MODIFY ("WHOLESALER_ORDER_ID" NOT NULL ENABLE);
  ALTER TABLE "AWUD3U"."WHOLESALE_ORDER_PRODUCTS" MODIFY ("ORDER_PRODUCT_ID" NOT NULL ENABLE);
  ALTER TABLE "AWUD3U"."WHOLESALE_ORDER_PRODUCTS" ADD CONSTRAINT "WHOLESALE_ORDER_PRODUCTS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table WHOLESALE_ORDERS
--------------------------------------------------------

  ALTER TABLE "AWUD3U"."WHOLESALE_ORDERS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "AWUD3U"."WHOLESALE_ORDERS" MODIFY ("WHOLESALER_ID" NOT NULL ENABLE);
  ALTER TABLE "AWUD3U"."WHOLESALE_ORDERS" ADD CONSTRAINT "WHOLESALE_ORDERS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "AWUD3U"."WHOLESALE_ORDERS" ADD CONSTRAINT "WHOLESALE_ORDERS__UN" UNIQUE ("ORDER_IDENTIFIER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table WHOLESALERS
--------------------------------------------------------

  ALTER TABLE "AWUD3U"."WHOLESALERS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "AWUD3U"."WHOLESALERS" ADD CONSTRAINT "WHOLESALERS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
