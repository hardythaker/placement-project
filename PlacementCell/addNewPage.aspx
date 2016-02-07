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
                
                <div style="display:inline">
                    <label for="fileTitle" class="mdl-typography--body-2-force-preferred-font-color-contrast" style="font-size:15px">Title :  </label>
                    <div class="mdl-textfield mdl-js-textfield">   
                        <asp:TextBox Class="mdl-textfield__input" ID="fileTitle" placeholder="Enter Notice Card Title" runat="server"></asp:TextBox>
                        <label class="mdl-textfield__label" for="sample1"></label>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic" Font-Bold="True" Font-Size="Large" ControlToValidate="fileTitle"></asp:RequiredFieldValidator>
                </div>
                
                <div style="display:inline">
                    <label for="fileTitle" class="mdl-typography--body-2-force-preferred-font-color-contrast" style="font-size:15px">Description :  </label>
                    <div class="mdl-textfield mdl-js-textfield">   
                        <asp:TextBox Class="mdl-textfield__input" ID="fileDesc" placeholder="Enter Notice Card Description" runat="server"></asp:TextBox>
                        <label class="mdl-textfield__label" for="sample1"></label>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" Display="Dynamic" Font-Bold="True" Font-Size="Large" ControlToValidate="fileDesc"></asp:RequiredFieldValidator>
                </div>
                <div style="display:inline">
                    <asp:CheckBox ID="CheckBox1" runat="server" Visible="false" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="True"></asp:CheckBox>
                    <asp:Label ID="chkBox_Label" runat="server" Text="Check This Box, If you Want to Chage the Uploaded File." ForeColor="Red" Visible="false"></asp:Label>
                </div>  
               
                <div id="hideIT" runat="server">                             
                <div style="display:inline">
                    <label for="options" class="mdl-typography--body-2-force-preferred-font-color-contrast" style="font-size:15px">Notice Type :  </label>
                        
                        <label class="mdl-radio  mdl-js-radio mdl-js-ripple-effect" for="option1">
                            <input enableviewstate="true" type="radio" id="option1" Class="mdl-radio__button" name="options" <%=this.selectRadioButton == "htmlPage" ? "checked='checked'" : ""%> value="htmlPage">
                            <span class="mdl-radio__label">Html Page</span>
                        </label>
                                <div id="tt1" class="icon material-icons mdl-color-text--accent" style="margin-top:8px">help_outline</div> <%--info icon will fetch from google server--%>
                                <div class="mdl-tooltip" style="font-size:10px" for="tt1">
                                    A word File Converted to a Web Page. 
                                    A web Page will get open After Clickng View More
                                </div>
                        
                        <label class="mdl-radio  mdl-js-radio mdl-js-ripple-effect" for="option2">
                            <input enableviewstate="true"  type="radio" id="option2" class="mdl-radio__button" name="options" value="image" <%=this.selectRadioButton == "image" ? "checked='checked'" : ""%>>
                            <span class="mdl-radio__label">Image</span>
                        </label>
                                <div id="tt2" class="icon material-icons mdl-color-text--accent" style="margin-top:8px">help_outline</div> <%--info icon will fetch from google server--%>
                                <div class="mdl-tooltip" style="font-size:10px" for="tt2">
                                    To upload A Image. 
                                    A Image that will Open after clicking View More.
                                </div>
                        
                        <label class="mdl-radio  mdl-js-radio mdl-js-ripple-effect" for="option3">
                            <input enableviewstate="true" type="radio" id="option3" class="mdl-radio__button" name="options" value="downloadLink" <%=this.selectRadioButton == "downloadLink" ? "checked='checked'" : ""%>>
                            <span class="mdl-radio__label">Download Link</span>
                        </label>
                                <div id="tt3" class="icon material-icons mdl-color-text--accent" style="margin-top:8px">help_outline</div> <%--info icon will fetch from google server--%>
                                <div class="mdl-tooltip" style="font-size:10px" for="tt3">
                                    A File will be downloaded After Clicking on View More Button.
                                    For eg: A Large File
                                </div> 
                </div>
                <br />

                <div style="display:inline-block">
                    <asp:FileUpload ID="FileUpload1" CssClass="mdl-typography--body-2-force-preferred-font-color-contrast" runat="server" AllowMultiple="True" ViewStateMode="Enabled" EnableViewState="True" />
                    <br />
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
