<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmAllAirman.aspx.cs" Inherits="work01.frmAllAirman" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <div class="row">
            <div class="col mt-4">
                <h2>All Airman</h2>
                <div class="d-flex justify-content-end mb-3">
                    <a href="frmAirmanEntry.aspx" class="btn btn-outline-info">Add New</a>
                </div>
                <asp:GridView ID="GridView1" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="aId" DataSourceID="dsAllAirman" OnRowUpdating="GridView1_RowUpdating">
                    <Columns>
                        <asp:BoundField DataField="aId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="aId" />
                        <asp:TemplateField HeaderText="Name" SortExpression="aName">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" CssClass="form-control" runat="server" Text='<%# Bind("aName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("aName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Age" SortExpression="age">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAge" CssClass="form-control" TextMode="Number" runat="server" Text='<%# Bind("age") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("age") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Join Date" SortExpression="joinDate">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtJoinDate" CssClass="form-control" TextMode="Date" runat="server" Text='<%# Bind("joinDate","{0:yyyy-MM-dd}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("joinDate","{0:yyyy-MM-dd}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Rank" SortExpression="rankId">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlEditRank" CssClass="form-control" runat="server" DataSourceID="dsddlEditRank" DataTextField="rankName" DataValueField="rankId" SelectedValue='<%# Bind("rankId") %>'></asp:DropDownList>
                                <asp:SqlDataSource ID="dsddlEditRank" runat="server" ConnectionString="<%$ ConnectionStrings:AirmanDB2ConnectionString %>" DeleteCommand="DELETE FROM [tbl_Rank] WHERE [rankId] = @rankId" InsertCommand="INSERT INTO [tbl_Rank] ([rankName]) VALUES (@rankName)" SelectCommand="SELECT * FROM [tbl_Rank]" UpdateCommand="UPDATE [tbl_Rank] SET [rankName] = @rankName WHERE [rankId] = @rankId">
                                    <DeleteParameters>
                                        <asp:Parameter Name="rankId" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="rankName" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                         <asp:Parameter Name="rankName" Type="String" />
                                        <asp:Parameter Name="rankId" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("rankName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Picture" SortExpression="picture">
                            <EditItemTemplate>
                                <asp:FileUpload ID="FileUpload1" runat="server"  CssClass="form-control"/>
                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("picture") %>'/>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("picture","~/Images/{0}") %>' Height="50px" Width="50px"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="In Service?" SortExpression="isInService">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("isInService") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("isInService") %>' Enabled="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-outline-success"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-outline-warning"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-outline-info"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-outline-danger"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="dsAllAirman" runat="server" ConnectionString="<%$ ConnectionStrings:AirmanDB2ConnectionString %>" DeleteCommand="DELETE FROM [tbl_Airman] WHERE [aId] = @aId" InsertCommand="INSERT INTO [tbl_Airman] ([aName], [age], [joinDate], [rankId], [picture], [isInService]) VALUES (@aName, @age, @joinDate, @rankId, @picture, @isInService)" SelectCommand="SELECT a.aId,a.aName,a.age,a.joinDate,a.rankId,r.rankName,a.picture,a.isInService FROM tbl_Airman a INNER JOIN tbl_Rank r ON a.rankId = r.rankId" UpdateCommand="UPDATE [tbl_Airman] SET [aName] = @aName, [age] = @age, [joinDate] = @joinDate, [rankId] = @rankId, [picture] = @picture, [isInService] = @isInService WHERE [aId] = @aId">
                    <DeleteParameters>
                        <asp:Parameter Name="aId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="aName" Type="String" />
                        <asp:Parameter Name="age" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="joinDate" />
                        <asp:Parameter Name="rankId" Type="Int32" />
                        <asp:Parameter Name="picture" Type="String" />
                        <asp:Parameter Name="isInService" Type="Boolean" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="aName" Type="String" />
                        <asp:Parameter Name="age" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="joinDate" />
                        <asp:Parameter Name="rankId" Type="Int32" />
                        <asp:Parameter Name="picture" Type="String" />
                        <asp:Parameter Name="isInService" Type="Boolean" />
                        <asp:Parameter Name="aId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
