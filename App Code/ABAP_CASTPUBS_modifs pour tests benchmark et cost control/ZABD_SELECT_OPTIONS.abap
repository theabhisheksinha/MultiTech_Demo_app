INCLUDE_NAME ZABD_SELECT_OPTIONS.
*&---------------------------------------------------------------------*
*&  Include           ZABD_SELECT_OPTIONS                             *
*&---------------------------------------------------------------------*



  SELECT-OPTIONS: s_title FOR titles-title,
                  s_title_id  FOR titles-title_id,
                  s_au_id  FOR titleauthor-au_id.

  SELECTION-SCREEN SKIP.

  SELECT-OPTIONS: s_city FOR publishers-city DEFAULT '1000'
                  OBLIGATORY NO-EXTENSION NO INTERVALS.

  PARAMETERS:     p_date       LIKE sy-datum DEFAULT sy-datum,
                  p_auid      LIKE authors-auid,
                  p_datereponse  LIKE rf130-datereponse,
                  p_imprime      LIKE pri_params-pdest. "Imprimeur