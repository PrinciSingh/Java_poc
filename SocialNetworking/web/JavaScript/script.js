/*window.onblur= function() {window.onfocus= function () {location.reload(true)}};*/
function checkPostField()
{
    var postfield = document.form1.postmsg.value;
    if(postfield==null || postfield == "")
    {
        alert("Enter Some Post Message.");
        document.form1.postmsg.focus();
        return false;
    }
}

function suggest()
{
        var xmlhttp;
        var elem = document.getElementById("searchbox").value;
        if(window.XMLHttpRequest)
        {
                xmlhttp = new XMLHttpRequest();
        }
        else if(window.ActiveXObject)
        {
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.open("GET","search_suggest.jsp?elem="+elem,true);
        xmlhttp.send();
        xmlhttp.onreadystatechange=function()
        {
                    if(xmlhttp.readyState==4 && xmlhttp.status==200)
                    {
                            var data = xmlhttp.responseText;
                            if(data.trim()=="no")
                            {
                                document.getElementById('suggestion').style.backgroundColor="";
                                document.getElementById('suggestion').style.border="";
                                document.getElementById('suggestion').innerHTML="";
                            }
                            else
                            {
                                //document.getElementById('suggestion').style="border:2px solid black";
                                document.getElementById('suggestion').style.backgroundColor="#FFFBF0";
                                document.getElementById('suggestion').style.border="1px solid grey";
                                document.getElementById('suggestion').style.borderTop="none";
                                document.getElementById('suggestion').style.borderRadius="6px";
                                document.getElementById('suggestion').style.display="inline";
                                document.getElementById('suggestion').style.textDecoration="none";
                                document.getElementById('suggestion').innerHTML=data;
                            }
                }
            }

}

function showRequest()
{
    var xmlhttp;
    if(window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();
    }
    else if(window.ActiveXObject)
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xmlhttp.open("GET","show_friend_request.jsp",true);
    xmlhttp.send();

    xmlhttp.onreadystatechange=function()
    {
         if(xmlhttp.readyState==4 && xmlhttp.status==200)
        {
            
            var data = xmlhttp.responseText;
            if(data.trim()=="no")
            {
                document.getElementById('showrequest').style.backgroundColor="";
                document.getElementById('showrequest').style.border="";
                document.getElementById('showrequest').innerHTML="";
            }
            else
            {
            document.getElementById('showrequest').style.backgroundColor="#FFFBF0";
            document.getElementById('showrequest').style.border="1px solid grey";
            document.getElementById('showrequest').style.borderTop="none";
            document.getElementById('showrequest').style.borderRadius="6px";
            document.getElementById('showrequest').style.display="inline";
            document.getElementById('showrequest').style.textDecoration="none";
            document.getElementById('showrequest').innerHTML=data;
            }
            window.onblur= function() {window.onfocus= function () {location.reload(true)}};
        }
    }
}

function generateCreateAlbumField()
{
    document.getElementById("createalbumfield").innerHTML=
        "<tr>\n\
            <td width='179'><div align='right' class='style17'>Title</div></td>\n\
            <td width='216'><label><input type='text' name='title'/></label>\n\
                <span id='errormsgTitle' style='color:#FF0000; font-weight:bold'></span>\n\
            </td>\n\
        </tr>\n\
        <tr>\n\
            <td><div align='right' class='style17'>\n\
                Description</div></td>\n\
            <td><label>\n\
                <textarea name='description' rows='4' style='resize:none'></textarea>\n\
                </label><span id='errormsgDesc'></span></td>\n\
        </tr>\n\
        <tr>\n\
            <td colspan='2'><div align='center'>\n\
            <label>\n\
                <input type='submit' name='Submit' class='lbuttonr' value='Create' />\n\
                <input type='reset' name='reset' class='lbuttonr' value='Cancel' onclick='window.location.reload()'/>\n\
                </label>\n\
            </td>\n\
        </tr>";
}

function uploadFieldLearnZone()
{
    document.getElementById("uploadFileTable").innerHTML="\n\
    <tr>\n\
        <td><div align='right' class='style22'>Title</div></td>\n\
        <td><label>\n\
            <input name='title' type='text' class='rfield' />\n\
            </label></td>\n\
    </tr>\n\
    <tr>\n\
        <td><div align='right' class='style22'>Category</div></td>\n\
        <td><label>\n\
            <select name='select'>\n\
                <option>------------Select Category------------</option>\n\
                <option>Programming Language</option>\n\
                <option>DataBase</option>\n\
                <option>Web Design</option>\n\
                <option>Accounts</option>\n\
                <option>Accounts</option>\n\
                <option>Business Communication</option>\n\
                <option>Marketing</option>\n\
                <option>HR</option>\n\
                <option>House Management</option>\n\
                <option>Personality Development</option>\n\
                <option>Interview Skills</option>\n\
                <option>Mobile Development</option>\n\
                <option>Cooking</option>\n\
                <option>Medical</option>\n\
           </select>\n\
           </label></td>\n\
    </tr>\n\
    <tr>\n\
        <td> <div align='right' class='style22'>Description</div></td>\n\
        <td><label>\n\
            <textarea name='description' cols='25' rows='4' style='resize:none'></textarea>\n\
            </label></td>\n\
    </tr>\n\
    <tr>\n\
        <td> <div align='right' class='style22'>Upload</div></td>\n\
        <td><input type='file' name='uploadfile'></td>\n\
    </tr>\n\
    <tr>\n\
        <td><div align='right'><span class='style23'></span></div></td>\n\
        <td><label>\n\
            <input type='submit' name='Submit' value='Upload' id='uploadBtn'/>\n\
            <input type='reset' name='reset' id='uploadBtn' value='Cancel' onclick='window.location.reload()'/>\n\
</label></td>\n\
    </tr>";
}

function learningzoneSearch()
{
        var xmlhttp;
        var elem = document.getElementById("learnzonefield").value;
        if(elem=="")
        {
            document.getElementById("learnL").innerHTML="";
            return;
        }
        if(window.XMLHttpRequest)
        {
            xmlhttp = new XMLHttpRequest();
        }
        else if(window.ActiveXObject)
        {
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }

        xmlhttp.open("GET","learzone_suggestion.jsp?elem="+elem,true);
        xmlhttp.send();

        xmlhttp.onreadystatechange=function()
        {
            if(xmlhttp.readyState==4 && xmlhttp.status==200)
            {
                var data = xmlhttp.responseText;
                if(data.trim()=="no")
                {
                    alert(data);
                    document.getElementById("learnL").innerHTML ="";
                }
                else
                {
                    document.getElementById("learnL").innerHTML = data;
                }
            }
}
}