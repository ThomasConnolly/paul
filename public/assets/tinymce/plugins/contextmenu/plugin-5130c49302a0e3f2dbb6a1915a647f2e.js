tinymce.PluginManager.add("contextmenu",function(e){var t,n=e.settings.contextmenu_never_use_native;e.on("contextmenu",function(o){var i,c=e.getDoc();if(!o.ctrlKey||n){if(o.preventDefault(),tinymce.Env.mac&&tinymce.Env.webkit&&2==o.button&&c.caretRangeFromPoint&&e.selection.setRng(c.caretRangeFromPoint(o.x,o.y)),i=e.settings.contextmenu||"link image inserttable | cell row column deletetable",t)t.show();else{var a=[];tinymce.each(i.split(/[ ,]/),function(t){var n=e.menuItems[t];"|"==t&&(n={text:t}),n&&(n.shortcut="",a.push(n))});for(var r=0;r<a.length;r++)"|"==a[r].text&&(0===r||r==a.length-1)&&a.splice(r,1);t=new tinymce.ui.Menu({items:a,context:"contextmenu",classes:"contextmenu"}).renderTo(),e.on("remove",function(){t.remove(),t=null})}var m={x:o.pageX,y:o.pageY};e.inline||(m=tinymce.DOM.getPos(e.getContentAreaContainer()),m.x+=o.clientX,m.y+=o.clientY),t.moveTo(m.x,m.y)}})});