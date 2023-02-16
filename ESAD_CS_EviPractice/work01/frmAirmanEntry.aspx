<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmAirmanEntry.aspx.cs" Inherits="work01.frmAirmanEntry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <div class="row">
            <div class="col mt-4">
                <h2>Add New Airman</h2>
                <asp:DetailsView ID="DetailsView1" CssClass="table table-bordered" runat="server" AutoGenerateRows="False" DataKeyNames="aId" DataSourceID="dsAirmanEntry" DefaultMode="Insert" OnItemInserting="DetailsView1_ItemInserting">
                    <Fields>
                        <%--Id--%>
                        <asp:BoundField DataField="aId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="aId" />

                        <%--Name--%>
                        <asp:TemplateField HeaderText="Name" SortExpression="aName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("aName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtName" CssClass="form-control" runat="server" Text='<%# Bind("aName") %>'></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is Required." ControlToValidate="txtName" Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True">Name can&#39;t be empty!!</asp:RequiredFieldValidator>

                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Name!!" ControlToValidate="txtName" Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True" ValidationExpression="[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$">Enter a valid Name</asp:RegularExpressionValidator>

                                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Invalid Name!!" ControlToValidate="txtName" Display="Dynamic" ForeColor="#CC0000" OnServerValidate="CustomValidator1_ServerValidate" SetFocusOnError="True">Name must contain atleast 4 characters.</asp:CustomValidator>

                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("aName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%--Age--%>
                        <asp:TemplateField HeaderText="Age" SortExpression="age">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAge" CssClass="form-control" TextMode="Number" runat="server" Text='<%# Bind("age") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtAge" CssClass="form-control" TextMode="Number" runat="server" Text='<%# Bind("age") %>'></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Age is Required." ControlToValidate="txtAge" Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Age must be greater than 18 and less than 59." ControlToValidate="txtAge" Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True" MaximumValue="59" MinimumValue="18">Age must be greater than 18 and less than 59.</asp:RangeValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("age") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%--Join Date--%>
                        <asp:TemplateField HeaderText="Join Date" SortExpression="joinDate">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("joinDate") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtJoinDate" CssClass="form-control" TextMode="Date" runat="server" Text='<%# Bind("joinDate") %>'></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Join Date is Required." ControlToValidate="txtJoinDate" Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True">Join Date can&#39;t be Empty!</asp:RequiredFieldValidator>

                                <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txtJoinDate" Display="Dynamic" ForeColor="#CC0000" Operator="DataTypeCheck" SetFocusOnError="true" runat="server" ErrorMessage="Invalid Date!!">Enter a valid date!!</asp:CompareValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("joinDate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%--Rank--%>
                        <asp:TemplateField HeaderText="Rank" SortExpression="rankId">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("rankId") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlInsertRank" InitialValue="Select" CssClass="form-control" runat="server" DataSourceID="dsddlInsertRank" DataTextField="rankName" DataValueField="rankId" SelectedValue='<%# Bind("rankId") %>'></asp:DropDownList>
                                <asp:SqlDataSource ID="dsddlInsertRank" runat="server" ConnectionString="<%$ ConnectionStrings:AirmanDB2ConnectionString %>" DeleteCommand="DELETE FROM [tbl_Rank] WHERE [rankId] = @rankId" InsertCommand="INSERT INTO [tbl_Rank] ([rankName]) VALUES (@rankName)" SelectCommand="SELECT * FROM [tbl_Rank]" UpdateCommand="UPDATE [tbl_Rank] SET [rankName] = @rankName WHERE [rankId] = @rankId">
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

                                <%--<asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="CompareValidator"></asp:CompareValidator>--%>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("rankId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%--Picture--%>
                        <asp:TemplateField HeaderText="Picture" SortExpression="picture">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("picture") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:FileUpload ID="FileUploadPicture" runat="server" CssClass="form-control"/>
                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("picture") %>'/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Picture is Required." ControlToValidate="FileUploadPicture" Display="Dynamic" ForeColor="#CC0000" SetFocusOnError="True">Picture can&#39;t be Empty!></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("picture") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%--Is In Service--%>
                        <asp:TemplateField HeaderText="In Service?" SortExpression="isInService">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("isInService") %>' />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("isInService") %>' />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("isInService") %>' Enabled="false" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%--Buttons--%>
                        <asp:TemplateField ShowHeader="False">
                            <InsertItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-outline-primary"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-outline-warning"></asp:LinkButton>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="dsAirmanEntry" runat="server" ConnectionString="<%$ ConnectionStrings:AirmanDB2ConnectionString %>" DeleteCommand="DELETE FROM [tbl_Airman] WHERE [aId] = @aId" InsertCommand="INSERT INTO [tbl_Airman] ([aName], [age], [joinDate], [rankId], [picture], [isInService]) VALUES (@aName, @age, @joinDate, @rankId, @picture, @isInService)" SelectCommand="SELECT * FROM [tbl_Airman]" UpdateCommand="UPDATE [tbl_Airman] SET [aName] = @aName, [age] = @age, [joinDate] = @joinDate, [rankId] = @rankId, [picture] = @picture, [isInService] = @isInService WHERE [aId] = @aId">
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
