
$.fn.tabbedDialog = function(setting){
   if(typeof setting==='object'){
      this.tabs(setting.tabs).find( ".ui-tabs-nav" ).sortable({ axis: "x" });
      $( ".tabs-bottom .ui-tabs-nav, .tabs-bottom .ui-tabs-nav > *" ).addClass( "ui-corner-bottom" );
      this.dialog(setting.dialog);
         
      this.find('.ui-tab-dialog-close').append($('a.ui-dialog-titlebar-close'));
      this.find('.ui-tab-dialog-close').css({'position':'absolute','right':'0', 'top':'23px'});
      this.find('.ui-tab-dialog-close > a').css({'float':'none','padding':'0'});
      this.find('.ui-state-default').css({'width':'117px','height':'65px','line-height':'65px'});
      this.find('.ui-state-default > a').css({
         'font-size':'28px',
         'width':'117px',
         'display':'inline-block',
         'line-height':'65px',
         'text-align':'center',
         'margin':'0px auto',
         'padding':'0px'
      });
      var tabul = this.find('ul:first');
      this.parent().addClass('ui-tabs').prepend(tabul).draggable('option', 'handle', tabul); 
      this.siblings('.ui-dialog-titlebar').remove();
      tabul.addClass('ui-dialog-titlebar');
   
   }else{
      //this.tabs();
      this.dialog(setting);
   }
};
