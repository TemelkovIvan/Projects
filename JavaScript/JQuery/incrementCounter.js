function increment(selector) {
    let container=$(selector);
    let fragment=$('div');
    let textArea=$('<textarea>');
    let incrementBtn=$('<button>');
    let addBtn=$('<button>');
    let reductionBtn=$('<button>');
    let list=$('<ul>');

    textArea
        .addClass('counter')
        .val(0).
        attr('disabled','disabled');

    textArea.appendTo(fragment);
    incrementBtn.appendTo(fragment);
    reductionBtn.appendTo(fragment);
    addBtn.appendTo(fragment);
    list.appendTo(fragment);
    fragment.appendTo(container);

    incrementBtn
        .addClass('btn')
        .attr('id','incrementBtn')
        .text('Increment');
   
    reductionBtn
        .addClass('btn')
        .attr('id','ReductionBtn')
        .text('Reduction'); 
        
    addBtn
        .addClass('btn')
        .attr('id','addBtn')
        .text('Add');

    list.addClass('result');
}

$('body')
    .on('click','#incrementBtn',function() {
        let textAreaValue=parseInt($('textarea').val());
        $('textarea').val(textAreaValue+1);
    })
    .on('click','#ReductionBtn',function() {
        let textAreaValue=parseInt($('textarea').val());
        $('textarea').val(textAreaValue-1);
    })
    .on('click','#addBtn',function() {
        let textAreaValue=parseInt($('textarea').val());
        let li=$('<li>');
        li.text(textAreaValue);
        li.appendTo('ul');
    })

increment('#wrapper')