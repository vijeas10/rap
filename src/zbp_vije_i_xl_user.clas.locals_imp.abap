CLASS lhc_XLHead DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR XLHead RESULT result.

    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE XLHead.

    METHODS uplaodExcelData FOR MODIFY
      IMPORTING keys FOR ACTION XLHead~uplaodExcelData RESULT result.

    METHODS FillFileStatus FOR DETERMINE ON MODIFY
      IMPORTING keys FOR XLHead~FillFileStatus.

    METHODS FillSelectedStatus FOR DETERMINE ON MODIFY
      IMPORTING keys FOR XLHead~FillSelectedStatus.

ENDCLASS.

CLASS lhc_XLHead IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_create.

    DATA(wl_user) = cl_abap_context_info=>get_user_technical_name( ).
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<fs_entity>).
      APPEND CORRESPONDING #( <fs_entity> ) TO mapped-xlhead ASSIGNING FIELD-SYMBOL(<fs_mapped>).
      IF <fs_mapped> IS ASSIGNED.
        <fs_mapped>-EndUser = wl_user.
        IF <fs_mapped>-FileId IS INITIAL.
          TRY.
              <fs_mapped>-FileId = cl_system_uuid=>create_uuid_x16_static( ).
            CATCH cx_uuid_error.
              "Update Error Message
              APPEND VALUE #( %cid = <fs_entity>-%cid

                              %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                             text    = 'Issue in Unique File ID Creation'
                                                            )

                               ) TO reported-xlhead.
          ENDTRY.
        ENDIF.

      ELSE."Update Error Message
        APPEND VALUE #( %cid = <fs_entity>-%cid

                        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                       text    = 'Issue in Unique File ID Creation'
                                                      )

                         ) TO reported-xlhead.

      ENDIF.

    ENDLOOP.




  ENDMETHOD.

  METHOD uplaodExcelData.
  ENDMETHOD.

  METHOD FillFileStatus.
  ENDMETHOD.

  METHOD FillSelectedStatus.
  ENDMETHOD.

ENDCLASS.
