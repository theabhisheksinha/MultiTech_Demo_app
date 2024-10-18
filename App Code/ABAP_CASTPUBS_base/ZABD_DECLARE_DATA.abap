INCLUDE_NAME ZABD_DECLARE_DATA.
*&---------------------------------------------------------------------*
*&  Include           ZABD_DECLARE_DATA                             *


*&---------------------------------------------------------------------*

TYPE-POOLS: slis.

* Tabellen
TABLES: defects,
        titles,
        titleauthor,
        authors,
        publishers,
        orders.



* Variablen
DATA reponse.
DATA v_reponse.
DATA gv_ord           TYPE titleauthor-au_ord. "Kontoinhaber ROYALTYPER --> TITLE_ID
DATA selection        LIKE addr1_sel.
DATA address_value    LIKE addr1_val.
DATA gv_success       TYPE i.
DATA g_count(4)       TYPE n.
DATA gv_date          TYPE sy-datum.
DATA gv_time          TYPE sy-uzeit.
DATA srf	      TYPE C.


* Konstanten
CONSTANTS: cons_city  TYPE authors-city      VALUE '1000',
           cons_stor_id1 TYPE stores-stor_id   VALUE '0026',
           cons_stor_id2 TYPE stores-stor_id   VALUE '0029',
           cons_event_vbund(4)       TYPE c VALUE '0703',
           cons_event_vbund_druck(4) TYPE c VALUE '0702',
           cons_applk                       VALUE 'T'.

* Interne Tabellen
DATA gt_authors    TYPE TABLE OF authors.
DATA gt_titles    TYPE TABLE OF titles.
DATA gt_titleauthor    TYPE TABLE OF titleauthor.
DATA gt_fieldcat TYPE slis_t_fieldcat_alv.
DATA gt_stores  TYPE TABLE OF stores.


DATA: BEGIN OF gt_verarbeitung OCCURS 0,
    au_id TYPE authors-au_id,
    royaltyper TYPE titleauthor-royaltyper,
    title_id TYPE titles-title_id,
    shbkz TYPE c,
    au_lname TYPE authors-au_lname,
    au_fname TYPE authors-au_fname,
    phone TYPE authors-phone,
    country TYPE authors-country,
    city TYPE authors-city,
    state TYPE authors-state,
 END OF gt_verarbeitung.

DATA: BEGIN OF gt_titlestore OCCURS 0,
    postalcode TYPE crec_gp_kk,
    title_id     TYPE crec_gp_kk,
    state      TYPE corr_vkont_kk,
    name(60)   TYPE c,
    adrnr      TYPE crec_ad_kk,
    salwa      TYPE corr_blwae_kk,
    stor_name      TYPE corr_betrh_kk,
*   salwa(4)   TYPE c,
*   stor_name(20)  TYPE c,
    data4      TYPE cdata_kk,
    coidt      TYPE coidt_kk,
    data2      TYPE cdata_kk,
*    data1      TYPE cdata_kk,
    color(3)   TYPE c ,
 END OF gt_titlestore.

DATA:  BEGIN OF gt_listheader OCCURS 0,
    postalcode TYPE crec_gp_kk,
    title_id    TYPE crec_gp_kk,
*    state    TYPE corr_vkont_kk,
    data4    TYPE cdata_kk,
    coidt    TYPE cdata_kk,
    expa,
    data2    TYPE cdata_kk,
*    data1      TYPE cdata_kk,
 END OF gt_listheader.



* Arbeitsbereiche
DATA wa_authors       TYPE authors.
DATA wa_titleauthor TYPE titleauthor.
DATA wa_fieldcat    LIKE LINE OF gt_fieldcat.
DATA wa_titlestore   LIKE LINE OF gt_titlestore.
* Rangetab
RANGES: rt_royaltyper  FOR defects-defect_id,
        rt_title_id  FOR titles-title_id,
        rt_au_id  FOR titleauthor-au_id.

* Strukturen
DATA gs_fkkcoinfo LIKE  fkkcoinfo.
DATA gs_layout    TYPE  slis_layout_alv.
DATA gs_keyinfo   TYPE  slis_keyinfo_alv.
DATA gs_header    TYPE slis_tabname.
DATA gs_ausgabe   TYPE slis_tabname.



* Feldsymbol
FIELD-SYMBOLS  <fs_titleauthort>   LIKE LINE OF gt_titleauthor.
FIELD-SYMBOLS  <fs_titles>   LIKE LINE OF gt_titles.
FIELD-SYMBOLS  <fs_authors>   LIKE LINE OF gt_authors.
FIELD-SYMBOLS  <fs_verarb>  LIKE LINE OF gt_verarbeitung.
FIELD-SYMBOLS  <fs_titlestore>    LIKE LINE OF gt_titlestore.
FIELD-SYMBOLS  <fs_stores> LIKE LINE OF gt_stores.
FIELD-SYMBOLS  <fs_fbstab>  TYPE ANY.