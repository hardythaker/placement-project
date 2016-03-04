<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="student_profile.aspx.cs" Inherits="PlacementCell.student_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            height: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="server">
    <form method="post" runat="server">
        <div class="mdl-card mdl-shadow--6dp" style="width: 100%">
            <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                <h2 class="mdl-card__title-text" style="text-align: center">My Profile</h2>
            </div>
            <asp:Label ID="lbl_dataFetchingError" runat="server" Text=""></asp:Label>
            <br />
            <div runat="server" id="div_overAllData">
                <div runat="server" id="div_overAllData_Not_Exist" style="display: none">
                    <p class="mdl-typography--title-color-contrast mdl-color-text--accent mdl-typography--font-bold">
                        No Data Found<br>
                        First Fill the <a href="student_PersonalDetails.aspx">Student Detail Form</a>. 
                    </p>
                </div>
                <div runat="server" id="div_overAllData_Exist">
                    <p class="mdl-typography--title-color-contrast">Personal Details</p>
                    <hr>
                    <div runat="server" id="div_PersonalData_Not_Exist" style="display: none">
                        <p>No Personal Data Found</p>
                    </div>
                    <%--this div is Never Going to Show Because student cannot directly Fill the other details, if they do so, the data is not going to save in data base--%>
                    <div runat="server" id="div_PersonalData_Exist" style="text-align: left; padding-left: 10px">
                        <div>
                            <label for="lbl_name" class="mdl-typography--subhead mdl-typography--font-bold">Name :</label>
                            <asp:Label ID="lbl_name" runat="server" class="mdl-typography--subhead" Text=""></asp:Label>
                        </div>
                        <div style="display: block">
                            <div>
                                <label for="lbl_email" class="mdl-typography--subhead mdl-typography--font-bold">Email :</label>
                                <asp:Label ID="lbl_email" class="mdl-typography--subhead" runat="server" Text=""></asp:Label>
                            </div>

                            <div>
                                <label for="lbl_gender" class="mdl-typography--subhead mdl-typography--font-bold">Gender :</label>
                                <asp:Label ID="lbl_gender" class="mdl-typography--subhead" runat="server" Text=""></asp:Label>
                            </div>
                            <div>
                                <label for="lbl_maritial" class="mdl-typography--subhead mdl-typography--font-bold">Maritial Status :</label>
                                <asp:Label ID="lbl_maritial" class="mdl-typography--subhead" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div>
                            <div>
                                <label for="lbl_mobile_dob" class="mdl-typography--subhead mdl-typography--font-bold">Mobile No :</label>
                                <asp:Label ID="lbl_mobile_dob" class="mdl-typography--subhead" runat="server" Text=""></asp:Label>
                            </div>
                            <div>
                                <label for="lbl_dob" class="mdl-typography--subhead mdl-typography--font-bold">D.O.B :</label>
                                <asp:Label ID="lbl_dob" class="mdl-typography--subhead" runat="server" Text=""></asp:Label>
                            </div>
                            <div>
                                <a href="student_PersonalDetails.aspx">
                                    <div style="display: inline-flex">
                                        <div>
                                            <span class="material-icons" id="ico_edit" style="font-size: 18px; padding-top: 1px">mode_edit</span>
                                        </div>
                                        <label for="ico_edit">Edit </label>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <p class="mdl-typography--title-color-contrast">Graduation Details</p>
                    <hr>
                    <div runat="server" id="div_GradData_Not_Exist" style="display: none">
                        <p>No Graduation Data Found</p>
                    </div>
                    <div runat="server" id="div_GradData_Exist" style="text-align: left; padding-left: 10px">
                        <div style="">
                            <div>
                                <label for="lbl_branch" class="mdl-typography--subhead mdl-typography--font-bold">Branch :</label>
                                <asp:Label ID="lbl_branch" runat="server" Text="" class="mdl-typography--subhead"></asp:Label>
                            </div>
                            <div>
                                <label for="lbl_division" class="mdl-typography--subhead mdl-typography--font-bold">Division :</label>
                                <asp:Label ID="lbl_division" runat="server" Text="" class="mdl-typography--subhead"></asp:Label>
                            </div>
                            <div>
                                <label for="lbl_rollNo" class="mdl-typography--subhead mdl-typography--font-bold">Roll No :</label>
                                <asp:Label ID="lbl_rollNo" runat="server" Text="" class="mdl-typography--subhead"></asp:Label>
                            </div>
                            <div>
                                <label for="lbl_backlogs" class="mdl-typography--subhead mdl-typography--font-bold">Live Backlogs :</label>
                                <asp:Label ID="lbl_backlogs" runat="server" Text="" class="mdl-typography--subhead"></asp:Label>
                            </div>
                        </div>
                        <div style="">
                            <div>
                                <label for="lbl_sem1M" class="mdl-typography--subhead mdl-typography--font-bold">Sem 1 Marks :</label>
                                <asp:Label ID="lbl_sem1M" runat="server" Text="" class="mdl-typography--subhead"></asp:Label>
                            </div>
                        </div>
                        <div style="">
                            <div>
                                <label for="lbl_sem2M" class="mdl-typography--subhead mdl-typography--font-bold">Sem 2 Marks :</label>
                                <asp:Label ID="lbl_sem2M" runat="server" Text="" class="mdl-typography--subhead"></asp:Label>
                            </div>
                        </div>
                        <div style="">
                            <div>
                                <label for="lbl_sem3M" class="mdl-typography--subhead mdl-typography--font-bold">Sem 3 Marks :</label>
                                <asp:Label ID="lbl_sem3M" runat="server" Text="" class="mdl-typography--subhead"></asp:Label>
                            </div>
                        </div>
                        <div style="">
                            <div>
                                <label for="lbl_sem4M" class="mdl-typography--subhead mdl-typography--font-bold">Sem 4 Marks :</label>
                                <asp:Label ID="lbl_sem4M" runat="server" Text="" class="mdl-typography--subhead"></asp:Label>
                            </div>
                        </div>
                        <div>
                            <label for="lbl_gradAvgP" class="mdl-typography--subhead mdl-typography--font-bold">Total Average Percentage :</label>
                            <asp:Label ID="lbl_gradAvgP" runat="server" Text="" class="mdl-typography--subhead"></asp:Label>
                        </div>
                        <div>
                            <a href="student_TyAcademicDetails.aspx">
                                <div style="display: inline-flex">
                                    <div>
                                        <span class="material-icons" style="font-size: 18px; padding-top: 1px">mode_edit</span>
                                    </div>
                                    Edit
                                </div>
                            </a>
                        </div>
                    </div>
                    <hr>
                    <p class="mdl-typography--title-color-contrast">HSC Details</p>
                    <hr>
                    <div runat="server" id="div_Hsc_DataNotExist" style="display: none">
                        <p>No HSC Data Found</p>
                    </div>
                    <div runat="server" id="div_Hsc_DataExist" style="text-align: left; padding-left: 10px">
                        <div style="">
                            <div>
                                <label for="lbl_HscBoardName" class="mdl-typography--subhead mdl-typography--font-bold">Board :</label>
                                <asp:Label ID="lbl_HscBoardName" runat="server" Text=""></asp:Label>
                            </div>
                            <div>
                                <label for="lbl_HscSpecialization" class="mdl-typography--subhead mdl-typography--font-bold">Specialization :</label>
                                <asp:Label ID="lbl_HscSpecialization" runat="server" Text=""></asp:Label>
                            </div>
                            <div>
                                <label for="lbl_HscCourseType" class="mdl-typography--subhead mdl-typography--font-bold">Course Type :</label>
                                <asp:Label ID="lbl_HscCourseType" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div style="">
                            <div>
                                <label for="lbl_HscM" class="mdl-typography--subhead mdl-typography--font-bold">Marks :</label>
                                <asp:Label ID="lbl_HscM" runat="server" Text=""></asp:Label>
                            </div>
                            <div>
                                <a href="student_HSCDetails.aspx"><div style="display: inline-flex">
                                    <div>
                                        <span class="material-icons" style="font-size: 18px; padding-top: 1px">mode_edit</span>
                                    </div>
                                    Edit
                                </div></a>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <p class="mdl-typography--title-color-contrast">SSC Details</p>
                    <hr>
                    <div runat="server" id="div_Ssc_DataNotExist" style="display: none">
                        <p>No SSC Data Found</p>
                    </div>
                    <div runat="server" id="div_Ssc_DataExist" style="text-align: left; padding-left: 10px">
                        <div style="">
                            <div>
                                <label for="lbl_SscBoardName" class="mdl-typography--subhead mdl-typography--font-bold">Board :</label>
                                <asp:Label ID="lbl_SscBoardName" runat="server" Text=""></asp:Label>
                            </div>
                            <div>
                                <label for="lbl_SscCourseType" class="mdl-typography--subhead mdl-typography--font-bold">Course Type :</label>
                                <asp:Label ID="lbl_SscCourseType" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div style="">
                            <div>
                                <label for="lbl_SscM" class="mdl-typography--subhead mdl-typography--font-bold">Marks :</label>
                                <asp:Label ID="lbl_SscM" runat="server" Text=""></asp:Label>
                            </div>
                            <div>
                                <a href="student_SSCDetails.aspx"><div style="display: inline-flex">
                                    <div>
                                        <span class="material-icons" style="font-size: 18px; padding-top: 1px">mode_edit</span>
                                    </div>
                                    Edit
                                </div></a>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <p class="mdl-typography--title-color-contrast">Other Details</p>
                    <hr>
                    <div runat="server" id="div_other_DataNotExist" style="display: none">
                        <p>No Other Data Found</p>
                    </div>
                    <div runat="server" id="div_other_DataExist" style="text-align: left; padding-left: 10px">
                        <div>
                            <div>
                                <label for="lbl_OtherDetail_Break" class="mdl-typography--subhead mdl-typography--font-bold">Break(Years) : </label>
                                <asp:Label ID="lbl_OtherDetail_Break" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div>
                            <a href="student_OtherDetails.aspx"><div style="display: inline-flex">
                                    <div>
                                        <span class="material-icons" style="font-size: 18px; padding-top: 1px">mode_edit</span>
                                    </div>
                                    Edit
                                </div></a>
                        </div>
                    </div>
                    <br />
                    <br />
                    <br />
                </div>
            </div>
        </div>
    </form>
</asp:Content>
