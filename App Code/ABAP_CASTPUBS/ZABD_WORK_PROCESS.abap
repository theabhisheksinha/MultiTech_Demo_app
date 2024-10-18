INCLUDE_NAME ZABD_WORK_PROCESS.
*&---------------------------------------------------------------------*
*&  Include           ZABD_WORK_PROCESS                          *
*&---------------------------------------------------------------------*

INITIALIZATION.

* perform authority_check.
  PERFORM choixrecepteur.

AT SELECTION-SCREEN OUTPUT.
  PERFORM screen.


AT SELECTION-SCREEN.
  PERFORM controleentree.


START-OF-SELECTION.

  PERFORM branche_numeroclient.
  PERFORM branche_contratcompte.
  PERFORM branche_societe.

END-OF-SELECTION.