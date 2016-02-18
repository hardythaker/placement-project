<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="addNewPage.aspx.cs" Inherits="PlacementCell.addNewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height: 100%;
        }
    </style>
    <script type="text/javascript">
    $(function () {
        $("#CheckBox1").click(function () {
            if ($(this).is(":checked")) {
                $("#hideIT").show();
            } else {
                $("#hideIT").hide();
            }
        });
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <form runat="server" id="addnewPage" method="post">
        <center>
            <div class="mdl-card mdl-shadow--6dp" style="width:75vw">
            <br /><asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                <p style="color:red" class="mdl-typography--body-2-force-preferred-font-color-contrast">Note : Carefully make changes to ths section.</p>
                
                <div style="display:inline; padding-left:5vw; padding-right:5vw;">
                    <label for="fileTitle" class="mdl-typography--body-2-force-preferred-font-color-contrast" style="font-size:15px">Title :  </label>
                    <div class="mdl-textfield mdl-js-textfield">   
                        <asp:TextBox Class="mdl-textfield__input" ID="fileTitle" placeholder="Enter Notice Card Title" runat="server"></asp:TextBox>
                        <label class="mdl-textfield__label" for="sample1"></label>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic" Font-Bold="True" Font-Size="Large" ControlToValidate="fileTitle"></asp:RequiredFieldValidator>
                </div>
                
                <div style="display:inline; padding-left:5vw; padding-right:5vw;">
                    <label for="fileTitle" class="mdl-typography--body-2-force-preferred-font-color-contrast" style="font-size:15px">Description :  </label>
                    <div class="mdl-textfield mdl-js-textfield">   
                        <asp:TextBox Class="mdl-textfield__input" ID="fileDesc" placeholder="Enter Notice Card Description" runat="server"></asp:TextBox>
                        <label class="mdl-textfield__label" for="sample1"></label>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic" Font-Bold="True" Font-Size="Large" ControlToValidate="fileDesc"></asp:RequiredFieldValidator>
                </div>
                <div style="display:inline; padding-left:5vw; padding-right:5vw;">
                    <asp:CheckBox ID="CheckBox1" runat="server" Visible="false" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="True"></asp:CheckBox>
                    <asp:Label ID="chkBox_Label" runat="server" Text="Check This Box, If you Want to Chage the Uploaded File." ForeColor="Red" Visible="false"></asp:Label>
                </div>  
               
                <div id="hideIT" runat="server">
                <div style="display: inline;">
                    <label for="option1" class="mdl-typography--body-2-force-preferred-font-color-contrast">Section :</label>
                            <label class="mdl-radio  mdl-js-radio mdl-js-ripple-effect" for="rdBtn_option-1">
                                <input type="radio" id="rdBtn_option-1" class="mdl-radio__button" name="sections" value="1" <%=this.selectedSectionRB == "1" ? "checked='checked'" : ""%>>
                                <span class="mdl-radio__label mdl-typography--body-2-force-preferred-font-color-contrast">Achievments</span>
                            </label>
                        <label class="mdl-radio  mdl-js-radio mdl-js-ripple-effect" for="rdBtn_option-2">
                            <input type="radio" id="rdBtn_option-2" class="mdl-radio__button" name="sections" value="2" <%=this.selectedSectionRB == "2" ? "checked='checked'" : ""%>>
                            <span class="mdl-radio__label mdl-typography--body-2-force-preferred-font-color-contrast">Notices</span>
                        </label>
                </div>
                    <br />                       
                <div style="display:inline-flex; padding-left:5vw; padding-right:5vw;">
                        <label for="options" class="mdl-typography--body-2-force-preferred-font-color-contrast" style="font-size:15px">Type :&nbsp;</label>
                        <label class="mdl-radio  mdl-js-radio mdl-js-ripple-effect" for="option1">
                            <input enableviewstate="true" type="radio" id="option1" Class="mdl-radio__button" name="options" <%=this.selectRadioButton == "htmlPage" ? "checked='checked'" : ""%> value="htmlPage">
                            <span class="mdl-radio__label mdl-typography--body-2-force-preferred-font-color-contrast">Html Page</span>
                        </label>&nbsp;
                                <div id="tt1" class="icon material-icons mdl-color-text--accent" style="padding-bottom:4px">help_outline</div> <%--info icon will fetch from google server--%>
                                <div class="mdl-tooltip" style="font-size:14px" for="tt1">
                                    A word File Converted to a Web Page.<br> 
                                    That Page will get open After Clickng View More
                                </div>
                        &nbsp;&nbsp;&nbsp;
                        <label class="mdl-radio  mdl-js-radio mdl-js-ripple-effect" for="option2">
                            <input enableviewstate="true"  type="radio" id="option2" class="mdl-radio__button" name="options" value="image" <%=this.selectRadioButton == "image" ? "checked='checked'" : ""%>>
                            <span class="mdl-radio__label mdl-typography--body-2-force-preferred-font-color-contrast">Image</span>
                        </label>&nbsp;
                                <div id="tt2" class="icon material-icons mdl-color-text--accent" style="padding-bottom:4px">help_outline</div> <%--info icon will fetch from google server--%>
                                <div class="mdl-tooltip" style="font-size:14px" for="tt2">
                                    To upload A Image.<br>
                                    That Image will Open after clicking View More.
                                </div>
                        &nbsp;&nbsp;&nbsp;
                        <label class="mdl-radio  mdl-js-radio mdl-js-ripple-effect" for="option3">
                            <input enableviewstate="true" type="radio" id="option3" class="mdl-radio__button" name="options" value="downloadLink" <%=this.selectRadioButton == "downloadLink" ? "checked='checked'" : ""%>>
                            <span class="mdl-radio__label mdl-typography--body-2-force-preferred-font-color-contrast">Download Link</span>
                        </label>&nbsp;
                                <div id="tt3" class="icon material-icons mdl-color-text--accent" style="padding-bottom:4px">help_outline</div> <%--info icon will fetch from google server--%>
                                <div class="mdl-tooltip" style="font-size:14px" for="tt3">
                                    A File will be downloaded<br> After Clicking on View More Button.<br>
                                    For eg: A Large File
                                </div> 
                </div>
                <br />

                <div style="display:inline-block; padding-left:5vw; padding-right:5vw;">
                    <asp:FileUpload ID="FileUpload1" CssClass="mdl-typography--body-2-force-preferred-font-color-contrast" runat="server" AllowMultiple="True" ViewStateMode="Enabled" EnableViewState="True" />
                    <asp:Label CssClass="mdl-typography--body-2-force-preferred-font-color-contrast" ID="fileHistory" runat="server" Text="" ForeColor="Red"></asp:Label>
                </div>
                </div>
                <br />
                <div>
                    <asp:Button CssClass="mdl-button mdl-button--raised mdl-color--primary mdl-shadow--8dp" ID="btnCreateNewPage" runat="server" Text="Create Notice" OnClick="btnCreateNewPage_Click" />
                </div>
                <br />
                <asp:Label ID="Label1" CssClass="mdl-typography--body-2-force-preferred-font-color-contrast" runat="server" Text="" ForeColor="Red"></asp:Label>
                <br />
            </div>
            </center>
        <br />
    </form>
</asp:Content>
