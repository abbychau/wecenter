(function () {
    function WecenterVideoDialog(editor) {
 
        return {
            title: '插入視頻',
            minWidth: 400,
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
                                    editor.insertHtml('<br /><video>' + this.getValue()  + '</video>');
                                    //editor.insertText( '!![視頻名稱](' + this.getValue() + ')' );
                                }
                            }
                        },
                        {
                            type: 'html',
                            html : '<p style="font-size:14px;color:#999;">我們目前支持: 優酷、酷六、土豆、56、新浪播客、樂視、Youtube 與 SWF 文件!</p>'
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
 
    CKEDITOR.dialog.add('WecenterVideo', function (editor) {
        return WecenterVideoDialog(editor);
    });
})();