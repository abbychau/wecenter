﻿(function () {
    function WecenterImageDialog(editor) {
 
        return {
            title: '插入圖片',
            minWidth: 470,
            minHeight: 110,
            buttons: [
                CKEDITOR.dialog.okButton,
                CKEDITOR.dialog.cancelButton
            ],
            contents:
            [
                {
                    elements:
                    [
                        {
                            id: 'text',
                            type: 'text',
                            required: true,
                            commit: function () {
                                if (this.getValue()) {
                                    this.imageElement = editor.document.createElement( 'img' );
                                    this.imageElement.setAttribute( 'src', this.getValue() );
                                    editor.insertElement( this.imageElement );
                                }
                            }
                        },
                        {
                            type: 'html',
                            html : '<p style="font-size:14px;color:#999;">如需要插入本地圖片, 請用編輯器下面上傳附件功能上傳後再插入!</p>'
                        }
                    ]
                }
            ],
            onLoad: function () {
                //alert('onLoad');
            },
            onShow: function () {
                //alert('onShow');
            },
            onHide: function () {
                //alert('onHide');
            },
            onOk: function () {
                this.commitContent();
            },
            onCancel: function () {
                //alert('onCancel');
            },
            resizable: false
        };
    }
 
    CKEDITOR.dialog.add('WecenterImage', function (editor) {
        return WecenterImageDialog(editor);
    });
})();