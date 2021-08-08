$(function(){
// 17211160109 黄成创
    $('#first_page').click(function(){
        for(i=0;i<5;i++)
        {
            $('#username'+i).html("")
            $('#password'+i).html("")
            $('#sex'+i).html("")
            $('#regtime'+i).html("")
            $('#id'+i).html("")
            $('#set'+i).html("")
            $('#type'+i).html("")
        }
        $.getJSON("userpage.jhtml", {page:"1"}, function(data, status){
            $.each(data, function(index, item){
                $('#username'+index).html(item.uName)
                // alert( $('#username'+index).html())
                $('#password'+index).html(item.uPassword)
                if(item.uSex==true)
                    $('#sex'+index).html("women")
                else
                    $('#sex'+index).html("man")
                if(item.uType==2)
                    $('#type'+index).html("administrator")
                else
                    $('#type'+index).html("user")
                if($('#type'+index).html()=="administrator")
                    $('#set'+index).html("<a href='changeType.jhtml?uId="+item.uId+"'>Cancel</a>")
                else($('#type'+index).html()=="user")
                $('#set'+index).html("<a href='changeType.jhtml?uId="+item.uId+"'>Set</a>")
                // alert($('#type'+index).html())
                $('#regtime'+index).html(getLocalTime(item.uRegtime).substring(0,10))
                $('#id'+index).html(parseInt((parseInt($("#the_page").html())-1)*5+index)+1)

            })
            $('#the_page').html("1")
            if($("#the_page").html()==1)
                $("#last_page").empty()
            else
                $("#last_page").html("last&nbsp")
            if($("#the_page").html()==$("#total_page").html())
                $("#next_page").empty()
            else
                $("#next_page").html("next&nbsp")
        })
    })
    $('#last_page').click(function(){
        for(i=0;i<5;i++)
        {
            $('#username'+i).html("")
            $('#password'+i).html("")
            $('#sex'+i).html("")
            $('#regtime'+i).html("")
            $('#id'+i).html("")
            $('#set'+i).html("")
            $('#type'+i).html("")
        }
        $.getJSON("userpage.jhtml", {page:parseInt($("#the_page").html())-1}, function(data, status){
            $.each(data, function(index, item){
                $('#username'+index).html(item.uName)
                $('#password'+index).html(item.uPassword)
                if(item.uSex==true)
                    $('#sex'+index).html("women")
                else
                    $('#sex'+index).html("man")
                if(item.uType==2)
                    $('#type'+index).html("administrator")
                else
                    $('#type'+index).html("user")
                if($('#type'+index).html()=="administrator")
                    $('#set'+index).html("<a href='changeType.jhtml?uId="+item.uId+"'>Cancel</a>")
                else($('#type'+index).html()=="user")
                $('#set'+index).html("<a href='changeType.jhtml?uId="+item.uId+"'>Set</a>")
                $('#regtime'+index).html(getLocalTime(item.uRegtime).substring(0,10))
                $('#id'+index).html(parseInt((parseInt($("#the_page").html())-2)*5+index)+1)
            })
            $('#the_page').html(parseInt($("#the_page").html())-1)
            if($("#the_page").html()==1)
                $("#last_page").empty()
            else
                $("#last_page").html("last&nbsp")
            if($("#the_page").html()==$("#total_page").html())
                $("#next_page").empty()
            else
                $("#next_page").html("next&nbsp")
        })

    })

    $('#next_page').click(function(){
        for(i=0;i<5;i++)
        {
            $('#username'+i).html("")
            $('#password'+i).html("")
            $('#sex'+i).html("")
            $('#regtime'+i).html("")
            $('#id'+i).html("")
            $('#set'+i).html("")
            $('#type'+i).html("")
        }
        $.getJSON("userpage.jhtml", {page:parseInt($("#the_page").html())+1}, function(data, status){
            $.each(data, function(index, item){
                $('#username'+index).html(item.uName)
                $('#password'+index).html(item.uPassword)
                if(item.uSex==true)
                    $('#sex'+index).html("women")
                else
                    $('#sex'+index).html("man")
                if(item.uType==2)
                    $('#type'+index).html("administrator")
                else
                    $('#type'+index).html("user")
                if($('#type'+index).html()=="administrator")
                    $('#set'+index).html("<a href='changeType.jhtml?uId="+item.uId+"'>Cancel</a>")
                else($('#type'+index).html()=="user")
                $('#set'+index).html("<a href='changeType.jhtml?uId="+item.uId+"'>Set</a>")
                // alert($('#set'+index).html())
                $('#regtime'+index).html(getLocalTime(item.uRegtime).substring(0,10))
                $('#id'+index).html(parseInt((parseInt($("#the_page").html()))*5+index)+1)
            })

            $('#the_page').html(parseInt($("#the_page").html())+1)
            if($("#the_page").html()==1)
                $("#last_page").empty()
            else
                $("#last_page").html("last&nbsp")
            if($("#the_page").html()==$("#total_page").html())
                $("#next_page").empty()
            else
                $("#next_page").html("next&nbsp")
        })
    })

    $('#end_page').click(function(){
        for(i=0;i<5;i++)
        {
            $('#username'+i).html("")
            $('#password'+i).html("")
            $('#sex'+i).html("")
            $('#regtime'+i).html("")
            $('#id'+i).html("")
            $('#set'+i).html("")
            $('#type'+i).html("")
        }
        $.getJSON("userpage.jhtml", {page:$("#total_page").html()}, function(data, status){
            $.each(data, function(index, item){
                $('#username'+index).html(item.uName)
                $('#password'+index).html(item.uPassword)
                if(item.uSex==true)
                    $('#sex'+index).html("women")
                else
                    $('#sex'+index).html("man")
                if(item.uType==2)
                    $('#type'+index).html("administrator")
                else
                    $('#type'+index).html("user")
                if($('#type'+index).html()=="administrator")
                    $('#set'+index).html("<a href='changeType.jhtml?uId="+item.uId+"'>Cancel</a>")
                else($('#type'+index).html()=="user")
                $('#set'+index).html("<a href='changeType.jhtml?uId="+item.uId+"'>Set</a>")
                $('#regtime'+index).html(getLocalTime(item.uRegtime).substring(0,10))
                $('#id'+index).html(parseInt((parseInt($("#total_page").html())-1)*5+index)+1)
            })
            $('#the_page').html($("#total_page").html())
            if($("#the_page").html()==1)
                $("#last_page").empty()
            else
                $("#last_page").html("last&nbsp")
            if($("#the_page").html()==$("#total_page").html())
                $("#next_page").empty()
            else
                $("#next_page").html("next&nbsp")
        })
    })

})
function getLocalTime(S) {
    return new Date(parseInt(S)).toLocaleString();
}