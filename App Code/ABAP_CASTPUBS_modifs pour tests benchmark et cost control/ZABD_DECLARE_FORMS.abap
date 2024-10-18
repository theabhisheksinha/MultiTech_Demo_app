INCLUDE_NAME ZABD_DECLARE_FORMS.
*&---------------------------------------------------------------------*
*&  Include           ZABD_DECLARE_FORMS                            *
*&---------------------------------------------------------------------*
**&--------------------------------------------------------------------*
*
**&--------------------------------------------------------------------*
*
*&---------------------------------------------------------------------*
*&      Form  choixrecepteur
*&---------------------------------------------------------------------*
*SCREEN-NAME       30   C  Feldname
*SCREEN-GROUP1      3   C  Bewertung der
*                          Modif-Gruppe 1
*SCREEN-GROUP2      3   C  Bewertung der
*                          Modif-Gruppe 2
*SCREEN-GROUP3      3   C  Bewertung der
*                          Modif-Gruppe 3
*SCREEN-GROUP4      3   C  Bewertung der
*                          Modif-Gruppe 4
*SCREEN-REQUIRED    1   C  Feld Mußeingabe
*SCREEN-INPUT       1   C  Feld eingabebereit
*SCREEN-OUTPUT      1   C  Feld wird angezeigt
*SCREEN-INTENSIFIED 1   C  Feld helleuchtend
*SCREEN-INVISIBLE   1   C  Feld unsichtbar
*SCREEN-LENGTH      1   X  Länge des Feldes
*SCREEN-ACTIVE      1   C  Feld aktiv
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM choixrecepteur .

  CHECK sy-batch IS INITIAL.

  CALL FUNCTION 'POPUP_WITH_3_BUTTONS_TO_CHOOSE'
    EXPORTING
*   DEFAULTOPTION       = '1'
      diagnosetext1       = text-006
*   DIAGNOSETEXT2       = ' '
*   DIAGNOSETEXT3       = ' '
      textline1           = text-007
*   TEXTLINE2           = ' '
*   TEXTLINE3           = ' '
      text_option1        = text-010
      text_option2        = text-004

      text_option3        = text-005

      titel               = text-001
   IMPORTING
      answer              = reponse
            .


ENDFORM.                    " choixrecepteur
*&---------------------------------------------------------------------*
*&      Form  branche_societe
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM branche_societe .

  CHECK NOT s_au_id[] IS INITIAL.

* Falls im Batch mehrere Selektionen gewählt wurden
  CLEAR s_title_id.
  CLEAR s_title_id[].

  SELECT  * INTO TABLE gt_titleauthor FROM titleauthor
                          WHERE title_id   IN s_title_id
                            AND au_id   IN s_au_id.

  IF sy-subrc <> 0.
    MESSAGE i004 WITH 'Societe(s)'(005).
    LEAVE PROGRAM.
  ENDIF.

  PERFORM calculs_equilibre.
  PERFORM TEST.
  PERFORM titlestore    USING cons_stor_id2.

ENDFORM.                    " branche_societe

FORM TEST.
	write : 'ajout'.
	SELECT SINGLE * FROM authors INTO wa_authors
          WHERE city IN s_city.
ENDFORM.


*&---------------------------------------------------------------------*
*&      Form  controleentree
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM controleentree .

  CASE sy-batch.
    WHEN space.

      CASE reponse.

        WHEN 1.

          IF s_title IS INITIAL.
            MESSAGE e028 WITH 'Titre du livre'.
          ENDIF.

        WHEN 2.
          IF s_title_id IS INITIAL.
            MESSAGE e028 WITH 'Id du livre'.

          ENDIF.

        WHEN 3.
          IF s_au_id IS INITIAL.
            MESSAGE e028 WITH 'Id de l auteur'.
          ENDIF.

      ENDCASE.


      CASE reponse.

        WHEN 1 OR 2.

* AUID rempli ?
          IF p_auid IS INITIAL.
            SET CURSOR FIELD 'P_AUID'.
            MESSAGE e025.
* Date de réponse remplie ?
          ELSEIF p_datereponse IS INITIAL.
            SET CURSOR FIELD 'P_DATEREPONSE'.
            MESSAGE e026.
          ENDIF.


* Il examine si AUID pour réponse existant
          SELECT SINGLE * FROM authors INTO wa_authors
          WHERE city IN s_city
          AND   phone = 'PHONE'
          AND   au_id = p_auid.

          IF sy-subrc NE 0.
            MESSAGE e008 WITH 'AUTHORS'(009).
          ENDIF.
* Il examine si adresse de réponse pour la pression de correspondance existant
          SELECT SINGLE * FROM titleauthor INTO wa_titleauthor
          WHERE au_id = p_auid.

          IF sy-subrc NE 0.
            MESSAGE e008 WITH 'TITLEAUTHOR'(011).
          ENDIF.

        WHEN 3.

* Imprimante remplie ?
          IF   p_imprime  IS INITIAL.
            SET CURSOR FIELD 'P_IMPRIME'.
            MESSAGE e027.
          ENDIF.
      ENDCASE.
    WHEN OTHERS.
* pas de limitation
      IF  s_title IS INITIAL AND s_title_id IS INITIAL
                             AND s_au_id IS INITIAL.
        MESSAGE e028.
* title/title_id/au_id limité
      ELSEIF NOT s_title IS INITIAL AND NOT s_title_id IS INITIAL
                                    AND NOT s_au_id IS INITIAL.
        MESSAGE e029.
* title/title_id limité
      ELSEIF NOT s_title IS INITIAL AND NOT s_title_id IS INITIAL.
        MESSAGE e029.
* title/au_id limité
      ELSEIF NOT s_title IS INITIAL AND NOT s_au_id IS INITIAL.
        MESSAGE e029.
* Pas de date de réponse
      ELSEIF NOT s_title IS INITIAL AND p_datereponse IS INITIAL.
        MESSAGE e026.
* Pas de réponse -id
      ELSEIF NOT s_title_id IS INITIAL AND p_auid IS INITIAL.
        MESSAGE e025.
* Pas de date de réponse
      ELSEIF NOT s_title_id IS INITIAL AND p_datereponse IS INITIAL.
        MESSAGE e026.
* Pas d'imprimeur indiqué
      ELSEIF NOT s_au_id IS INITIAL AND p_imprime IS INITIAL.
        MESSAGE e027.
      ELSEIF NOT p_auid IS INITIAL.
* Il examine si AUID pour réponse existant
        SELECT SINGLE * FROM authors INTO wa_authors
        WHERE city IN s_city
        AND   phone = 'PHONE'
        AND   au_id = p_auid.

        IF sy-subrc NE 0.
          MESSAGE e008 WITH 'AUTHORS'(009).
        ENDIF.
* Il examine si adresse de réponse pour la pression de correspondance existant
        SELECT SINGLE * FROM titleauthor INTO wa_titleauthor
        WHERE au_id = p_auid.

        IF sy-subrc NE 0.
          MESSAGE e008 WITH 'TITLEAUTHOR'(011).
        ENDIF.
      ENDIF.

  ENDCASE.


ENDFORM.                    " controleentree

*&---------------------------------------------------------------------*
*&      Form  init
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM init .

  CLEAR: rt_royaltyper,
         rt_royaltyper[],
         rt_title_id,
         rt_title_id[],
         rt_au_id,
         rt_au_id[].


ENDFORM.                    " init
*&---------------------------------------------------------------------*
*&      Form  open_form
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM open_form .

  DATA: itcpo LIKE itcpo.

  itcpo-tddest = p_imprime. "Spool: Element de sortie
  itcpo-tdnewid = 'X'.    "IMPRIMER: nouveau Spool - ordre (Liste)
  itcpo-tdimmed = ' '.    "IMPRIMER: Ne pas dépenser immédiatement

  CALL FUNCTION 'OPEN_FORM'
    EXPORTING
      device                      = 'PRINTER'
      dialog                      = ' '
      options                     = itcpo
    EXCEPTIONS
      canceled                    = 1
      device                      = 2
      form                        = 3
      options                     = 4
      unclosed                    = 5
      mail_options                = 6
      archive_error               = 7
      more_params_needed_in_batch = 8
      OTHERS                      = 9.
  IF sy-subrc <> 0.
    MESSAGE e011 WITH sy-subrc.
  ENDIF.

ENDFORM.                    " open_form
*&---------------------------------------------------------------------*
*&      Form  CLOSE_FORM
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM close_form .

  CALL FUNCTION 'CLOSE_FORM'
    EXCEPTIONS
      unopened                 = 1
      bad_pageformat_for_print = 2
      send_error               = 3
      OTHERS                   = 4.
  IF sy-subrc <> 0.
    MESSAGE e012 WITH sy-subrc.
  ENDIF.

ENDFORM.                    " CLOSE_FORM
*&---------------------------------------------------------------------*
*&      Form  end_form
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM end_form .

  CALL FUNCTION 'END_FORM'
    EXCEPTIONS
      unopened                 = 1
      bad_pageformat_for_print = 2
      OTHERS                   = 3.
  IF sy-subrc <> 0.
    MESSAGE e013 WITH sy-subrc.
  ENDIF.

ENDFORM.                    " end_form
*&---------------------------------------------------------------------*
*&      Form  start_form
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_0696   text
*----------------------------------------------------------------------*
FORM start_form  USING    form.

  CALL FUNCTION 'START_FORM'
    EXPORTING
      form     = form
    EXCEPTIONS
      form     = 1
      format   = 2
      unended  = 3
      unopened = 4
      unused   = 5
      OTHERS   = 6.
  IF sy-subrc <> 0.
    MESSAGE e014 WITH sy-subrc form.
  ENDIF.

ENDFORM.                    " start_form
*&---------------------------------------------------------------------*
*&      Form  WRITE_FORM
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_0705   text
*      -->P_0706   text
*----------------------------------------------------------------------*
FORM write_form  USING    window
                          element.

  CALL FUNCTION 'WRITE_FORM'
    EXPORTING
      element                  = element
      window                   = window
    EXCEPTIONS
      element                  = 1
      function                 = 2
      type                     = 3
      unopened                 = 4
      unstarted                = 5
      window                   = 6
      bad_pageformat_for_print = 7
      OTHERS                   = 8.
  IF sy-subrc <> 0.
    MESSAGE e015 WITH sy-subrc window element.
  ENDIF.

ENDFORM.                    " WRITE_FORM

FORM titlestore1 USING p_stor_id LIKE stores-stor_id.
  LOOP AT gt_titlestore ASSIGNING <fs_titlestore>.

    CASE p_stor_id.
      WHEN cons_stor_id1.
        CONCATENATE p_datereponse+6(2) '.'
                    p_datereponse+4(2) '.'
                    p_datereponse(4)
                    INTO <fs_titlestore>-data2.
      WHEN OTHERS.
        READ TABLE gt_titleauthor WITH KEY title_id = <fs_titlestore>-title_id
        ASSIGNING <fs_titleauthor>.
        CONCATENATE 'AU_ID' <fs_titleauthor>-au_id INTO
                <fs_titlestore>-data2 SEPARATED BY space.
    ENDCASE.


    AT NEW royaltyper.

      MOVE-CORRESPONDING <fs_titlestore> TO gt_listheader.
      CONCATENATE gt_listheader-coidt+6(2) '.'
                  gt_listheader-coidt+4(2) '.'
                  gt_listheader-coidt(4)
                  INTO gt_listheader-coidt.

      APPEND gt_listheader.
* Anzahl Saldenbestätigungen
      ADD 1 TO l_count2.
      selection-addrnumber = <fs_titlestore>-adrnr.

      CALL FUNCTION 'ADDR_GET'
        EXPORTING
          address_selection             =  selection
*                      ADDRESS_GROUP                 =
*                      READ_ORDERS_ONLY                = ' '
*                      READ_TEXTS                    = ' '
       IMPORTING
*                      ADDRESS_VALUE                 =
*                      ADDRESS_ADDITIONAL_INFO       =
*                      RETURNCODE                    =
*                      ADDRESS_TEXT                  =
         orders                          =  orders
*                    TABLES
*                      ADDRESS_GROUPS                =
*                      ERROR_TABLE                   =
*                      VERSIONS                      =
                    EXCEPTIONS
                      parameter_error               = 1
                      address_not_exist             = 2
                      version_not_exist             = 3
                      internal_error                = 4
                      OTHERS                        = 5
                .
      IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
      ENDIF.

      CONCATENATE orders-stor_id orders-order_num INTO <fs_titlestore>-name.
      <fs_titlestore>-title_id =  <fs_titlestore>-postalcode.


      CONTINUE.
    ENDAT.
  ENDLOOP.
ENDFORM.                    " titlestore

*&---------------------------------------------------------------------*
*&      Form  titlestore
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM titlestore USING p_stor_id LIKE stores-stor_id.
  DATA: l_count1(3) TYPE c,
        l_count2(3) TYPE c,
        lt_help  LIKE gt_titlestore OCCURS 3,
        wa_help  LIKE gt_titlestore.

  CASE p_stor_id.
    WHEN cons_stor_id1.
      SELECT * FROM stores INTO
      CORRESPONDING FIELDS OF TABLE gt_titlestore
                                  WHERE stor_id = p_stor_id
                                  AND   uname = sy-uname
*                                 AND   laufd = gv_datum
                                  AND   laufi = gs_fkkcoinfo-laufi
                                  AND   coidt = gv_date
                                  AND   coitm GE gv_time
                               ORDER BY postalcode.
    WHEN OTHERS.
  ENDCASE.

  LOOP AT gt_titlestore ASSIGNING <fs_titlestore>.

    CASE p_stor_id.
      WHEN cons_stor_id1.
        CONCATENATE p_datereponse+6(2) '.'
                    p_datereponse+4(2) '.'
                    p_datereponse(4)
                    INTO <fs_titlestore>-data2.
      WHEN OTHERS.
        READ TABLE gt_titleauthor WITH KEY title_id = <fs_titlestore>-title_id
        ASSIGNING <fs_titleauthor>.
        CONCATENATE 'AU_ID' <fs_titleauthor>-au_id INTO
                <fs_titlestore>-data2 SEPARATED BY space.
    ENDCASE.

* Anzahl Nullsalden
    IF <fs_titlestore>-stor_name IS INITIAL.
      ADD 1 TO l_count1.
    ENDIF.

    AT NEW royaltyper.

      MOVE-CORRESPONDING <fs_titlestore> TO gt_listheader.
      CONCATENATE gt_listheader-coidt+6(2) '.'
                  gt_listheader-coidt+4(2) '.'
                  gt_listheader-coidt(4)
                  INTO gt_listheader-coidt.

      APPEND gt_listheader.
* Anzahl Saldenbestätigungen
      ADD 1 TO l_count2.
      selection-addrnumber = <fs_titlestore>-adrnr.

      CALL FUNCTION 'ADDR_GET'
        EXPORTING
          address_selection             =  selection
*                      ADDRESS_GROUP                 =
*                      READ_ORDERS_ONLY                = ' '
*                      READ_TEXTS                    = ' '
       IMPORTING
*                      ADDRESS_VALUE                 =
*                      ADDRESS_ADDITIONAL_INFO       =
*                      RETURNCODE                    =
*                      ADDRESS_TEXT                  =
         orders                          =  orders
*                    TABLES
*                      ADDRESS_GROUPS                =
*                      ERROR_TABLE                   =
*                      VERSIONS                      =
                    EXCEPTIONS
                      parameter_error               = 1
                      address_not_exist             = 2
                      version_not_exist             = 3
                      internal_error                = 4
                      OTHERS                        = 5
                .
      IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
      ENDIF.

      CONCATENATE orders-stor_id orders-order_num INTO <fs_titlestore>-name.
* royaltyper für Ausgabe übernehmen.
      <fs_titlestore>-title_id =  <fs_titlestore>-postalcode.


      CONTINUE.
    ENDAT.
  ENDLOOP.


* Nochmal: Summenbildung verträgt sich nicht mit Field-Symbols
  LOOP AT gt_titlestore.

    AT LAST.
      SUM.
* Header
      CLEAR gt_listheader.
      MOVE 'XXXXXXXXXX' TO gt_listheader-postalcode.
      MOVE '**************************' TO gt_listheader-data4.
      MOVE '   ENDE LISTE' TO gt_listheader-coidt.
      MOVE '**************************' TO gt_listheader-data2.
*      MOVE '**************************' TO gt_listheader-data1.
      APPEND gt_listheader.
      CLEAR gt_listheader.
      MOVE 'YYYYYYYYYY' TO gt_listheader-postalcode.
*      MOVE 'Saldenbest.'TO gt_listheader-data4.
      APPEND gt_listheader.
      CLEAR gt_listheader.
      MOVE 'ZZZZZZZZZZ' TO gt_listheader-postalcode.
*      MOVE 'Nullsalden'TO gt_listheader-data4.
      APPEND gt_listheader.

* Position
      CLEAR wa_help.
      MOVE 'XXXXXXXXXX'       TO wa_help-postalcode.
      MOVE 'Gesamtsumme:'     TO wa_help-name.
      MOVE 'EUR'              TO wa_help-salwa.
      MOVE gt_titlestore-stor_name TO wa_help-stor_name.
      APPEND wa_help TO lt_help.

      CLEAR wa_help.
      MOVE 'YYYYYYYYYY'       TO wa_help-postalcode.
      wa_help-name = 'Anzahl Saldenbestätigung(en):'.
      MOVE l_count2 TO wa_help-salwa.
*      CONCATENATE 'Anz.Saldenbestätigung(en):'  l_count2
*      INTO wa_help-name SEPARATED BY space.
      APPEND wa_help TO lt_help.

      CLEAR wa_help.
      MOVE 'ZZZZZZZZZZ'       TO wa_help-postalcode.
      wa_help-name = 'Anzahl Nullsalden:'.
      MOVE l_count1 TO wa_help-salwa.
*      CONCATENATE 'Anzahl Nullsalden:'  l_count1
*      INTO wa_help-name SEPARATED BY space.
      APPEND wa_help TO lt_help.
    ENDAT.

  ENDLOOP.


  LOOP AT lt_help INTO wa_help.
    APPEND wa_help TO gt_titlestore.
  ENDLOOP.

  PERFORM liste.

  CHECK sy-batch IS INITIAL.

  LEAVE PROGRAM.


ENDFORM.                    " titlestore
*&---------------------------------------------------------------------*
*&      Form  alv_fieldcat
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM alv_fieldcat .

************************* Header ***************************
* Kostenart
  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname        = 'DATA4'.
  wa_fieldcat-tabname          = 'GT_LISTHEADER'.
  wa_fieldcat-ref_tabname      = 'DFFKCOH'.
  wa_fieldcat-ref_fieldname    = 'DATA4'.
  wa_fieldcat-seltext_l        = 'Abstimmstichtag'.
  wa_fieldcat-seltext_m        = 'Abstimmstichtag'.
  wa_fieldcat-seltext_s        = 'Abstimmstichtag'.
  wa_fieldcat-reptext_ddic     = 'Abstimmstichtag'.
  wa_fieldcat-ddictxt          = 'M'.
  APPEND wa_fieldcat TO gt_fieldcat.
* TEXT
  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname        = 'COIDT'.
  wa_fieldcat-tabname          = 'GT_LISTHEADER'.
  wa_fieldcat-ref_tabname      = 'DFFKCOH'.
  wa_fieldcat-ref_fieldname    = 'COIDT'.
  wa_fieldcat-seltext_l        = 'Austellungsdatum'.
  wa_fieldcat-seltext_m        = 'Austellungsdatum'.
  wa_fieldcat-seltext_s        = 'Austellungsdatum'.
  wa_fieldcat-reptext_ddic     = 'Austellungsdatum'.
  wa_fieldcat-ddictxt          = 'M'.
  APPEND wa_fieldcat TO gt_fieldcat.
* TEXT
  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname        = 'DATA2'.
  wa_fieldcat-tabname          = 'GT_LISTHEADER'.
  wa_fieldcat-ref_tabname      = 'DFFKCOH'.
  wa_fieldcat-ref_fieldname    = 'DATA2'.
  wa_fieldcat-seltext_l        = 'Rückantwortdatum'.
  wa_fieldcat-seltext_m        = 'Rückantwortdatum'.
  wa_fieldcat-seltext_s        = 'Rückantwortdatum'.
  wa_fieldcat-reptext_ddic     = 'Rückantwortdatum'.
  wa_fieldcat-ddictxt          = 'M'.
  APPEND wa_fieldcat TO gt_fieldcat.
***********


****************** Ende Header ******************************

* Geschäftspartner
  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname        = 'TITLE_ID'.
  wa_fieldcat-ref_tabname      = 'STORES'.
  wa_fieldcat-ref_fieldname    = 'TITLE_ID'.
  wa_fieldcat-tabname          = 'GT_TITLESTORE'.
  wa_fieldcat-seltext_l        = 'Geschäftspartner'.
  wa_fieldcat-seltext_m        = 'Geschäftspartner'.
  wa_fieldcat-seltext_s        = 'Geschäftspartner'.
  wa_fieldcat-reptext_ddic     = 'Geschäftspartner'.
  wa_fieldcat-ddictxt          = 'L'.      "SHORT/MIDDLE/LONG
  APPEND wa_fieldcat TO gt_fieldcat.
* Vertragskonto
  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname        = 'TITLE_ID'.
  wa_fieldcat-ref_tabname      = 'STORES'.
  wa_fieldcat-ref_fieldname    = 'TITLE_ID'.
  wa_fieldcat-tabname          = 'GT_TITLESTORE'.
  wa_fieldcat-seltext_l        = 'Vertragskonto'.
  wa_fieldcat-seltext_m        = 'Vertragskonto'.
  wa_fieldcat-seltext_s        = 'Vertragskonto'.
  wa_fieldcat-reptext_ddic     = 'Vertragskonto'.
  wa_fieldcat-ddictxt          = 'M'.      "SHORT/MIDDLE/LONG
  APPEND wa_fieldcat TO gt_fieldcat.
* Name
  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname        = 'NAME'.
*  wa_fieldcat-ref_tabname      = 'AUFK'.
*  wa_fieldcat-ref_fieldname    = 'AUART'.
  wa_fieldcat-tabname          = 'GT_TITLESTORE'.
  wa_fieldcat-outputlen      = '40'.
  wa_fieldcat-seltext_l        = 'Name Geschäftspartner'.
  wa_fieldcat-seltext_m        = 'Name Geschäftspartner'.
  wa_fieldcat-seltext_s        = 'Name Geschäftspartner'.
  wa_fieldcat-reptext_ddic     = 'Name Geschäftspartner'.
  wa_fieldcat-ddictxt          = 'L'.
  APPEND wa_fieldcat TO gt_fieldcat.
* Währung
  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname        = 'SALWA'.
  wa_fieldcat-ref_tabname      = 'STORES'.
  wa_fieldcat-ref_fieldname    = 'SALWA'.
  wa_fieldcat-tabname          = 'GT_TITLESTORE'.
  wa_fieldcat-seltext_m        = 'Währung'.
  wa_fieldcat-seltext_s        = 'Währung'.
  wa_fieldcat-reptext_ddic     = 'Währung'.
  wa_fieldcat-ddictxt          = 'S'.
  APPEND wa_fieldcat TO gt_fieldcat.
* Betrag
  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname        = 'STOR_NAME'.
  wa_fieldcat-ref_tabname      = 'STORES'.
  wa_fieldcat-ref_fieldname    = 'STOR_NAME'.
  wa_fieldcat-tabname          = 'GT_TITLESTORE'.
  wa_fieldcat-seltext_l        = 'Betrag'.
  wa_fieldcat-seltext_m        = 'Betrag'.
  wa_fieldcat-seltext_s        = 'Betrag'.
  wa_fieldcat-reptext_ddic     = 'Betrag'.
  wa_fieldcat-ddictxt          = 'M'.      "SHORT/MIDDLE/LONG
  APPEND wa_fieldcat TO gt_fieldcat.


ENDFORM.                    " alv_fieldcat
*&---------------------------------------------------------------------*
*&      Form  liste
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM liste .

  PERFORM alv_fieldcat.

  PERFORM layout.

* FB-Strukturen füllen
  MOVE 'GT_LISTHEADER' TO gs_header.
  MOVE 'GT_TITLESTORE'  TO gs_ausgabe.
  gs_keyinfo-header01 = 'POSTALCODE'.
  gs_keyinfo-item01   = 'POSTALCODE'.
*  gs_keyinfo-header02 = 'TITLE_ID'.
*  gs_keyinfo-item02   = 'TITLE_ID'.


  CALL FUNCTION 'REUSE_ALV_HIERSEQ_LIST_DISPLAY'
       EXPORTING
*         I_INTERFACE_CHECK        = ' '
*         I_CALLBACK_PROGRAM       =
*         I_CALLBACK_PF_STATUS_SET = ' '
*         I_CALLBACK_USER_COMMAND  = ' '
           is_layout                = gs_layout
           it_fieldcat              = gt_fieldcat
*         IT_EXCLUDING             =
*         IT_SPECIAL_GROUPS        =
*         IT_SORT                  =
*         IT_FILTER                =
*         IS_SEL_HIDE              =
*         I_SCREEN_START_COLUMN    = 0
*         I_SCREEN_START_LINE      = 0
*         I_SCREEN_END_COLUMN      = 0
*         I_SCREEN_END_LINE        = 0
*         I_DEFAULT                = 'X'
*         I_SAVE                   = ' '
*         IS_VARIANT               = ' '
*         IT_EVENTS                =
*         IT_EVENT_EXIT            =
            i_tabname_header         = gs_header
            i_tabname_item           = gs_ausgabe
*         I_STRUCTURE_NAME_HEADER  =
*         I_STRUCTURE_NAME_ITEM    =
          is_keyinfo                 = gs_keyinfo

*         IS_PRINT                 =
*         IS_REPREP_ID             =
*    IMPORTING
*         E_EXIT_CAUSED_BY_CALLER  =
*         ES_EXIT_CAUSED_BY_USER   =
       TABLES
            t_outtab_header          =  gt_listheader[]
            t_outtab_item            =  gt_titlestore[]
    EXCEPTIONS
         program_error            = 1
         OTHERS                   = 2
            .
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.


ENDFORM.                    " liste
*&---------------------------------------------------------------------*
*&      Form  layout
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM layout .

* Layout festlegen
  gs_layout-zebra                = 'X'.      " Zebralook
  gs_layout-detail_popup         = 'X'.      " Details im Popup
  gs_layout-detail_initial_lines = 'X'.      " Auch Leerzeilen in Detail
*  gs_layout-no_vline             = ''.      " Trennung mit '|'
*  gs_layout-no_totalline         = 'X'.      " Trennung mit '-'
*  gs_layout-colwidth_optimize    = 'X'.      " Optimierung
*Spaltenbreite
*  gs_layout-expand_fieldname     = 'EXPA'.
  gs_layout-no_sumchoice         = 'X'.
*  gs_layout-expand_all           = 'X'.
  gs_layout-info_fieldname       = 'COLOR'.
*  gs_layout-coltab_fieldname     = 'GRUPPE'.

ENDFORM.                    " layout
*&---------------------------------------------------------------------*
*&      Form  branche_numeroclient
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM branche_numeroclient .

  CHECK NOT s_title[] IS INITIAL.

* Lecture des comptes de contrat
  SELECT  * FROM titles CLIENT SPECIFIED INTO TABLE gt_titles
                          WHERE mandt = sy-mandt
                            AND title IN s_title.

  IF sy-subrc <> 0.
    MESSAGE i004 WITH 'NumeroClient'(010).
    LEAVE PROGRAM.
  ENDIF.

* Déterminer Des valeurs pour FB
  LOOP AT gt_titles ASSIGNING <fs_titles>.
    rt_title_id-sign   = 'I'.
    rt_title_id-option = 'EQ'.
    rt_title_id-low    = <fs_titles>-title_id.
    APPEND rt_title_id.
  ENDLOOP.

  SELECT  * INTO TABLE gt_titleauthor FROM titleauthor
                          WHERE title_id IN rt_title_id
                           AND  royaltyper IN rt_royaltyper."leer

  PERFORM correspondance.
  PERFORM titlestore USING cons_stor_id1.

ENDFORM.                    " branche_numeroclient
*&---------------------------------------------------------------------*
*&      Form  correspondance
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM correspondance.

  CLEAR gs_fkkcoinfo.
  CLEAR g_count.

  ADD 1 TO g_count.
  gs_fkkcoinfo-laufd = sy-datum.
  CONCATENATE 'OP' g_count INTO gs_fkkcoinfo-laufi.


* remplir les conteneurs de correspondance 
  LOOP AT gt_titleauthor ASSIGNING <fs_titleauthor>.

    IF sy-tabix = 1.
* amortir le temps 
      GET TIME.

      gv_date = sy-datum.
      gv_time = sy-uzeit.

    ENDIF.


    CALL FUNCTION 'Z_DKK_SALDEN_OP_1907'
      EXPORTING
        i_fkkcoinfo         = gs_fkkcoinfo
        i_titleauthor       = <fs_titleauthor>
        i_datum             = p_date     "Abstimmstichtag
        i_auid              = p_auid    "Rückantwort Adress-id
        i_datereponse          = p_datereponse   "Rückgabedatum
*   I_FIKEY             =
*   I_CHGID             =
*   I_SIMULATION        = ' '
* IMPORTING
*   E_COMREQ            =
      CHANGING
        c_success_num       = gv_success
              .

  ENDLOOP.

ENDFORM.                    " correspondance
*&---------------------------------------------------------------------*
*&      Form  screen
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM screen .

  CHECK sy-batch IS INITIAL.

  LOOP AT SCREEN.

    CASE reponse.

      WHEN 'A'.
        LEAVE PROGRAM.
      WHEN 1.
        IF screen-name(7) = 'S_TITLE_ID'.
          screen-input = space.
        ELSEIF screen-name(7) = 'S_AU_ID'.
          screen-input = space.
        ELSEIF screen-name(7) = 'P_IMPRIME'.
          screen-input = space.
        ENDIF.
      WHEN 2.
        IF screen-name(7) = 'S_TITLE'.
          screen-input = space.
        ELSEIF screen-name(7) = 'S_AU_ID'.
          screen-input = space.
        ELSEIF screen-name(7) = 'P_IMPRIME'.
          screen-input = space.
        ENDIF.
      WHEN 3.
        IF screen-name(7) = 'S_TITLE'.
          screen-input = space.
        ELSEIF screen-name(7) = 'S_TITLE_ID'.
          screen-input = space.
        ELSEIF screen-name(7) = 'P_AUID'.
          screen-input = space.
        ELSEIF screen-name(8) = 'P_DATEREPONSE'.
          screen-input = space.
        ENDIF.
    ENDCASE.
    MODIFY SCREEN.
  ENDLOOP.

ENDFORM.                    " screen
*&---------------------------------------------------------------------*
*&      Form  calculs_equilibre
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM calculs_equilibre.

  DATA: lt_fbstab TYPE TABLE OF tfkfbc,
        wa_fbstab LIKE LINE OF lt_fbstab,
        lt_fimsg  TYPE TABLE OF fimsg.


  CLEAR: gs_fkkcoinfo,
         g_count,
         gt_titlestore[].

  ADD 2 TO g_count.
  gs_fkkcoinfo-laufd = sy-datum.
  CONCATENATE 'OP' g_count INTO gs_fkkcoinfo-laufi.


*  CALL FUNCTION 'FKK_FUNC_MODULE_DETERMINE'
*    EXPORTING
*      i_fbeve                  =  cons_event_vbund
*      i_applk                  =  cons_applk
**   I_ONLY_APPLICATION       = ' '
**   I_ONLY_CUSTOMER          = ' '
*    TABLES
*      t_fbstab                 =  lt_fbstab
*    EXCEPTIONS
*      OTHERS   = 1.
*
** ------ for cross reference purpose only -----------------------------
*
*  SET EXTENDED CHECK OFF.
*  IF 1 = 2.
*    CALL FUNCTION 'FKK_SAMPLE_0703'.
*    CALL FUNCTION 'FKK_FUNC_MODULE_DETERMINE_0703'.
*  ENDIF.
*  SET EXTENDED CHECK ON.
** ------ end of cross reference ---------------------------------------
*
*
*  LOOP AT lt_fbstab INTO wa_fbstab.

  LOOP AT gt_titleauthor ASSIGNING <fs_titleauthor>.

    IF sy-tabix = 1.
* Amortir le temps
      GET TIME.

      gv_date = sy-datum.
      gv_time = sy-uzeit.

    ENDIF.

*      CALL FUNCTION wa_fbstab-funcc
    CALL FUNCTION 'Z_DKK_SALDEN_OP_0703'
         EXPORTING
           i_fkkcoinfo              = gs_fkkcoinfo
           i_titleauthor            = <fs_titleauthor>
           i_datum                  = p_date
*   I_FIKEY                  =
*   I_CHGID                  =
*   I_FKK_PROT               =
*   I_PROBCLASS              =
*   I_XPERIOD_APPENDIX       = ' '
*   I_SIMULATION             = ' '
           i_stor_id                  = cons_stor_id2
*   I_FORMKEY                = ' '
* IMPORTING
*   E_COMREQ                 =
         TABLES
           t_fimsg                  = lt_fimsg
*   T_SEL_0002               =
*   T_PROT_GPART             =
*   T_PROT_VKONT             =
         CHANGING
           c_success_num            = gv_success
             EXCEPTIONS
               OTHERS      = 1.


  ENDLOOP.

*  ENDLOOP.


ENDFORM.                    " calculs_equilibre
*&---------------------------------------------------------------------*
*&      Form  imprimer
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_1739   text
*      -->P_1740   text
*----------------------------------------------------------------------*
FORM imprimer.


  DATA: lt_fbstab TYPE TABLE OF tfkfbc,
        wa_fbstab LIKE LINE  OF lt_fbstab,
        lt_fimsg  TYPE TABLE OF fimsg,
        ls_itcpo  LIKE itcpo,
        ls_efgpp  LIKE efg_printparams.



  CALL FUNCTION 'FKK_FUNC_MODULE_DETERMINE'
    EXPORTING
      i_fbeve                  =  cons_event_vbund_druck
      i_applk                  =  cons_applk
*   I_ONLY_APPLICATION       = ' '
*   I_ONLY_CUSTOMER          = ' '
    TABLES
      t_fbstab                 =  lt_fbstab
    EXCEPTIONS
      OTHERS   = 1.

* ------ for cross reference purpose only -----------------------------*
  SET EXTENDED CHECK OFF.
  IF 1 = 2.
    CALL FUNCTION 'FKK_SAMPLE_0702'.
    CALL FUNCTION 'FKK_FUNC_MODULE_DETERMINE_0702'.
  ENDIF.
  SET EXTENDED CHECK ON.
* ------ end of cross reference ---------------------------------------*

  DATA lv_state TYPE stores-state.


  SELECT * FROM stores INTO TABLE gt_stores
                             WHERE stor_id = cons_stor_id2
                             AND   uname = sy-uname
                             AND   state = lv_state
*                            AND   laufd = gv_datum
                             AND   laufi = gs_fkkcoinfo-laufi
                             AND   coidt = gv_date
                             AND   coitm GE gv_time
                         ORDER BY postalcode.


* Remplissage des paramètres d'impression
  PERFORM remplissage_structures CHANGING ls_itcpo
                                      ls_efgpp.


  LOOP AT lt_fbstab INTO wa_fbstab.

    LOOP AT gt_stores ASSIGNING <fs_stores>.
      CALL FUNCTION wa_fbstab-funcc
        EXPORTING
          i_stores              = <fs_stores>
          i_itcpo                = ls_itcpo
          i_efgpp                = ls_efgpp
*       I_ARCHIVE_PARAMS       =
*       I_ARCHIVE_INDEX        =
        TABLES
          t_fimsg                = lt_fimsg
          EXCEPTIONS
          OTHERS                 = 1
                .


*      CHECK sy-subrc = 0.

* rassembler les données de protocole 
      MOVE-CORRESPONDING <fs_stores> TO wa_titlestore.

**@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
* Il devient par l'élément fonctionnel de fonction (EVENT 703) 
* pas de montant (STOR_NAME) écrit dans 
* le conteneur de correspondance STORES.

* L'élément fonctionnel de fonction (EVENT 702) détermine le total 
* les postes ouverts et met l'histoire STORES à jour 
* avec le montant déterminé (Stor_name).

* lire un montant (STOR_NAME) de l'histoire pour protocole
      SELECT SINGLE stor_name FROM stores CLIENT SPECIFIED
                          INTO wa_titlestore-stor_name
                        WHERE mandt = <fs_stores>-mandt
                         AND  stor_id = <fs_stores>-stor_id
                         AND  postalcode = <fs_stores>-postalcode
                         AND  state = <fs_stores>-state
                         AND  stor_address = <fs_stores>-stor_address.
*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
      APPEND wa_titlestore TO gt_titlestore.

*  Gedruckt
      UPDATE stores SET state = sy-datum
      WHERE stor_address = <fs_titlestore>-stor_address.

  
    ENDLOOP.
  ENDLOOP.

ENDFORM.                    " imprimer
*&---------------------------------------------------------------------*
*&      Form  remplissage_structures
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      <--P_LS_ITCPO  text
*      <--P_LS_EFGPP  text
*
************************** ITCPO **************************************
*
*TDPAGESLCT	CHAR	60 Druckseitenauswahl
*TDCOPIES	INT1	3  Anzahl Ausdrucke
***TDDEST	CHAR  	4  Spool: Ausgabegerät
*TDPRINTER	CHAR	8  Spool: Name eines Gerätetyps
*TDPREVIEW	CHAR	1  Druckansicht
*TDNOPREV	CHAR	1  Keine Druckansicht zulassen
*TDNOPRINT	CHAR	1  Keine Druckausgabe aus Druckansicht
***TDNEWID	CHAR	10 Druckparameter, neuer Spool-Auftrag
*TDDATASET	CHAR	6  Spool-Auftrag: Name
*TDSUFFIX1	CHAR	4  Spool-Auftrag: Suffix1
*TDSUFFIX2	CHAR	12 Spool-Auftrag: Suffix2
***TDIMMED	CHAR	1  Druckparameter, sofort ausgeben
*TDDELETE	CHAR	1  Druckparameter,löschen nach Ausgabe
*TDLIFETIME	NUMC	1  Druckparameter, Spool-Verweildauer
*TDSCHEDULE	CHAR	3  Sendezeit Anforderung
*TDSENDDATE	DATS	8  Gewunschte Sendedatum
*TDSENDTIME	TIMS	6  Gewünschte Sendezeit
*TDTELELAND	CHAR	3  Länderschlüssel
*TDTELENUM	CHAR	30 Telekommunikationspartner
*TDTELENUM	CHAR	30 Telekommunikationspartner
*TDTITLE	CHAR	50 Titel im Dialogfenster
*TDTEST	CHAR	1  Test-Formular
*TDPROGRAM	CHAR	40 Programmname
*TDSCRNPOS	NUMC	15 Bildschirm-Anzeigeposition für OTF
*TDCOVER	CHAR	1  IMPRIMER: SAP-Deckblatt
*TDCOVTITLE	CHAR	68 Druckparameter, Text für Deckblatt
*TDRECEIVER	CHAR	12 Druckparameter, Empfänger
*TDDIVISION	CHAR	12 Druckparameter,Abteilung im Deckblatt
*TDAUTORITY	CHAR	12 IMPRIMER: Berechtigung
*TDARMOD	CHAR	1  IMPRIMER: Ablagemodus
*TDIEXIT	CHAR	1  Sofortiger Exit nach Imprimer/Faxen
*                                    aus Druckansicht
*TDGETOTF	CHAR	1  Rückgabe der OTF-Tabelle. Kein
*                                     Druck, Anzeigen oder Faxen
*TDFAXUSER	CHAR	12 Name des SAPoffice-Benutzers
*TDRDIDEV	CHAR	4  Spool: Ausgabegerät
*TDNOARMCH	CHAR	1  Keine Änderung des Archivmodus durch Benutzer
*TDFINAL	CHAR	1  Spool-Auftrag ist abgeschlossen
*RQPOSNAME	CHAR	50 Spool: Langer Name von Druckern
*                       beim Host-Spooler
*BCS_REQST	CHAR	1  Angeforderte Status
*BCS_REQST	CHAR	1  Angeforderte Status
*BCS_STATUS	CHAR	1  Einstellung, welche Status per Mail
*                       gemeldet werden
************************************************************************
***************************** ENDE ITCPO *******************************
************************************************************************
**************************** EFG_PRINTPARAMS ***************************

*DEVICE              CHAR	8  Ausgabeart
*RDI		       CHAR	1  Raw Data Interface
*FORMKEY		CHAR	30 Anwendungsformular
*FORMKEY_RDI		CHAR	30 Abweichendes RDI-Formular
*FORMCLASS		CHAR	30 Formularklasse
*DELAYED_PRINT	CHAR	1 Druckauftrag anstelle des Drucks
*                             erstellen
*LANGU	        	LANG	1  Sprachenkennzeichen im Anwendungsformular
*TEST_MODE		CHAR	1  Testmodus
*DEBUG	         	CHAR	1  Debug-Modus
*SENDTYPE		CHAR	10 Sendeart eines Dokuments
*REC_ADDR		CHAR	10 Adreßnummer
*REC_STRING		CHAR	50 String für Empfängeradresse
*SEND_ADDR		CHAR	10 Adreßnummer
*COPYFLAG	       CHAR	1  Exemplar ist eine Kopie
*REC_PERSNUMBER	CHAR	10 Personennummer
*LAST_DOC	       CHAR	1  VERALTET: Letztes Dokument
*LAST_DOC_ACT	       CHAR	1 Ausgabeauftrag nach dem letzten Dokument
*                             erzeugen
*OCL_ACTIVE	 	CHAR	1 Open/Close Logik ist aktiv
*SENDTYPE_EXT	       CHAR	4 Externe Sendeart
*SENDTYPE_EXT	       CHAR	4 Externe Sendeart
*NO_ACTIVATION	CHAR	1 Keine Aktivierung durchführen
*XSF	              CHAR	1 Ausgabeformat Smart Forms
*GET_XSF             CHAR	1 XSF-Daten an Anwendung übergeben
*NO_OPEN_FORM	       CHAR	1 VERALTET: NICHT VERWENDEN
*NO_CLOSE_FORM	CHAR	1 VERALTET: NICHT VERWENDEN
*SUPPRESS_COMMIT    CHAR	1 Allgemeines Kennzeichen
*BOR_RECOBJKEY	CHAR	70 Objektschlüssel
*GET_PWB_DATA        CHAR	1  Kennzeichen: Daten zurückliefern
*SPONUMIV            CHAR	2  Nummernkreisnummer
*SENDCONTROL	       CHAR	4  Versandsteuerung
*SENDCONTROL_X      CHAR  1 Kennzeichen:Einstellung übersteuert Default
************************************************************************
***************************ENDE  EFG_PRINTPARAMS ***********************
************************************************************************
*----------------------------------------------------------------------*
FORM remplissage_structures  CHANGING p_itcpo LIKE itcpo
                                  p_efgpp LIKE efg_printparams.


  DATA:  i_printparams LIKE eprintparams,
           e_printparams LIKE eprintparams.




** SAPscript Ausgabe Schnittstelle
  p_itcpo-tddest  = p_imprime.
  p_itcpo-tdnewid = 'X'.
  p_itcpo-tdimmed = 'X'.
**  p_itcpo-
**  p_itcpo-
**  p_itcpo-
**  p_itcpo-
**  p_itcpo-
**  p_itcpo-
**  p_itcpo-
*
** Zusätzliche Druckparameter zur ITCPO
*  p_efgpp-device       = 'PRINTER'.
*  p_efgpp-sendtype     = 'PRINTER'.
**  p_efgpp-xsf          = '*'.
**  p_efgpp-get_pwb_data = 'X'.
  p_efgpp-sendcontrol = '0001'.

**  p_efgpp-
**  p_efgpp-
**  p_efgpp-
**  p_efgpp-


ENDFORM.                    " remplissage_structures