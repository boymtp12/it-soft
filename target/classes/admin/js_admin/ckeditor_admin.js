$(function () {

    // var edit =
// / /Toolbar


})

function createCkeditor(id, height) {
    var users = [{
            id: 1,
            avatar: 'm_1',
            fullname: 'Charles Flores',
            username: 'cflores'
        }, {
            id: 2,
            avatar: 'm_2',
            fullname: 'Gerald Jackson',
            username: 'gjackson'
        }, {
            id: 3,
            avatar: 'm_3',
            fullname: 'Wayne Reed',
            username: 'wreed'
        }, {
            id: 4,
            avatar: 'm_4',
            fullname: 'Louis Garcia',
            username: 'lgarcia'
        }, {
            id: 5,
            avatar: 'm_5',
            fullname: 'Roy Wilson',
            username: 'rwilson'
        }, {
            id: 6,
            avatar: 'm_6',
            fullname: 'Matthew Nelson',
            username: 'mnelson'
        }, {
            id: 7,
            avatar: 'm_7',
            fullname: 'Randy Williams',
            username: 'rwilliams'
        }, {
            id: 8,
            avatar: 'm_8',
            fullname: 'Albert Johnson',
            username: 'ajohnson'
        }, {
            id: 9,
            avatar: 'm_9',
            fullname: 'Steve Roberts',
            username: 'sroberts'
        }, {
            id: 10,
            avatar: 'm_10',
            fullname: 'Kevin Evans',
            username: 'kevans'
        },

            {
                id: 11,
                avatar: 'w_1',
                fullname: 'Mildred Wilson',
                username: 'mwilson'
            }, {
                id: 12,
                avatar: 'w_2',
                fullname: 'Melissa Nelson',
                username: 'mnelson'
            }, {
                id: 13,
                avatar: 'w_3',
                fullname: 'Kathleen Allen',
                username: 'kallen'
            }, {
                id: 14,
                avatar: 'w_4',
                fullname: 'Mary Young',
                username: 'myoung'
            }, {
                id: 15,
                avatar: 'w_5',
                fullname: 'Ashley Rogers',
                username: 'arogers'
            }, {
                id: 16,
                avatar: 'w_6',
                fullname: 'Debra Griffin',
                username: 'dgriffin'
            }, {
                id: 17,
                avatar: 'w_7',
                fullname: 'Denise Williams',
                username: 'dwilliams'
            }, {
                id: 18,
                avatar: 'w_8',
                fullname: 'Amy James',
                username: 'ajames'
            }, {
                id: 19,
                avatar: 'w_9',
                fullname: 'Ruby Anderson',
                username: 'randerson'
            }, {
                id: 20,
                avatar: 'w_10',
                fullname: 'Wanda Lee',
                username: 'wlee'
            }
        ],
        tags = [
            'american',
            'asian',
            'baking',
            'breakfast',
            'cake',
            'caribbean',
            'chinese',
            'chocolate',
            'cooking',
            'dairy',
            'delicious',
            'delish',
            'dessert',
            'desserts',
            'dinner',
            'eat',
            'eating',
            'eggs',
            'fish',
            'food',
            'foodgasm',
            'foodie',
            'foodporn',
            'foods',
            'french',
            'fresh',
            'fusion',
            'glutenfree',
            'greek',
            'grilling',
            'halal',
            'homemade',
            'hot',
            'hungry',
            'icecream',
            'indian',
            'italian',
            'japanese',
            'keto',
            'korean',
            'lactosefree',
            'lunch',
            'meat',
            'mediterranean',
            'mexican',
            'moroccan',
            'nom',
            'nomnom',
            'paleo',
            'poultry',
            'snack',
            'spanish',
            'sugarfree',
            'sweet',
            'sweettooth',
            'tasty',
            'thai',
            'vegan',
            'vegetarian',
            'vietnamese',
            'yum',
            'yummy'
        ];

    function dataFeed(opts, callback) {
        var matchProperty = 'username',
            data = users.filter(function (item) {
                return item[matchProperty].indexOf(opts.query.toLowerCase()) == 0;
            });

        data = data.sort(function (a, b) {
            return a[matchProperty].localeCompare(b[matchProperty], undefined, {
                sensitivity: 'accent'
            });
        });

        callback(data);
    }

    CKEDITOR.config.entities = false;
    CKEDITOR.config.line_height = "1em;1.1em;1.2em;1.3em;1.4em;1.5em";
    CKEDITOR.replace(id, {
        uiColor: '#CCEAEE',

        language: 'vi',
        editorplaceholder: 'Start typing here...',
        width: '100%',
        height: height,
        extraPlugins: 'colorbutton,richcombo,floatpanel,panel,listblock,button,font,justify,print,tableresize,liststyle,pagebreak,exportpdf,editorplaceholder,uploadimage,format,colorbutton,image2,embed,autoembed,colordialog,tableresize,codesnippet,mathjax,copyformatting,widget,mentions,emoji,basicstyles,undo,link,wysiwygarea,toolbar,magicline',
        //code snipet
        codeSnippet_theme: 'monokai_sublime',
        // math
        mathJaxLib: 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-AMS_HTML',
        coreStyles_italic: {
            element: 'i',
            overrides: 'em'
        },
        //thêm 1 dòng table
        extraAllowedContent: 'div{border,background,text-align}',
        //emoj
        // plugins: 'mentions,emoji,basicstyles,undo,link,wysiwygarea,toolbar',
        contentsCss: [
            'https://cdn.ckeditor.com/4.16.0/full-all/contents.css',
            'https://ckeditor.com/docs/ckeditor4/4.16.0/examples/assets/css/widgetstyles.css',
            'https://ckeditor.com/docs/ckeditor4/4.16.0/examples/assets/mentions/contents.css'
        ],
        mentions: [{
            feed: dataFeed,
            itemTemplate: '<li data-id="{id}">' +
                '<img class="photo" src="assets/mentions/img/{avatar}.jpg" />' +
                '<strong class="username">{username}</strong>' +
                '<span class="fullname">{fullname}</span>' +
                '</li>',
            outputTemplate: '<a href="mailto:{username}@example.com">@{username}</a><span>&nbsp;</span>',
            minChars: 0
        }, {
            feed: tags,
            marker: '#',
            itemTemplate: '<li data-id="{id}"><strong>{name}</strong></li>',
            outputTemplate: '<a href="https://example.com/social?tag={name}">{name}</a><span>&nbsp;</span>',
            minChars: 1
        }],
        // Setup content provider. See https://ckeditor.com/docs/ckeditor4/latest/features/media_embed
        embed_provider: '//ckeditor.iframe.ly/api/oembed?url={url}&callback={callback}',
        // Configure the Enhanced Image plugin to use classes instead of styles and to disable the
        // resizer (because image size is controlled by widget styles or the image takes maximum
        // 100% of the editor width).
        image2_alignClasses: ['image-align-left', 'image-align-center', 'image-align-right'],
        image2_disableResizer: true
    });

    CKEDITOR.editorConfig = function (config) {
        config.toolbar = [{
            name: 'various',
            items: ['ExportPdf', '-', 'Undo', 'Redo']
        }, {
            name: 'document',
            items: ['Source', '-', 'Save', 'NewPage', 'ExportPdf', 'Preview', 'Print', '-', 'Templates']
        }, {
            name: 'clipboard',
            items: ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo']
        }, {
            name: 'editing',
            items: ['Find', 'Replace', '-', 'SelectAll', '-', 'Scayt']
        }, {
            name: 'forms',
            items: ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField']
        }, {
            name: 'basicstyles',
            items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'CopyFormatting', 'RemoveFormat']
        }, {
            name: 'paragraph',
            items: ['NumberedList', "LineHeight", 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language']
        }, {
            name: 'links',
            items: ['Link', 'Unlink', 'Anchor', 'EmojiPanel',]
        }, {
            name: 'insert',
            items: ['Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe']
        }, {
            name: 'styles',
            items: ['Styles', 'Format', 'Font', 'FontSize']
        }, {
            name: 'colors',
            items: ['TextColor', 'BGColor']
        }, {
            name: 'tools',
            items: ['Maximize', 'ShowBlocks']
        }, {
            name: 'about',
            items: ['About']
        }, {
            name: 'lineheight',
            items: ['1em', '1.2em', '1.5em', '2em', '2.5em']
        },];
    };
}