// 在模态框出现后添加可拖拽功能
$(document).on("show.bs.modal", ".modal", function() {
    // draggable 属性规定元素是否可拖动
    $(this).draggable({
        handle: ".modal-header", // 只能点击头部拖动
        cursor: 'move' //光标呈现为指示链接的指针（一只手）,
    });
    $(this).css("overflow", "hidden"); // 防止出现滚动条，出现的话，你会把滚动条一起拖着走的
});