   M S B A M L   `   `   `  ����   PorcelainInventoryApp1    +PorcelainInventoryApp.Views.CompUserControl   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   <d2http://schemas.microsoft.com/expression/blend/2008   .��� $��20q�  � RowDefinitions  �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��* ��� $
��Auto ��� $
��Auto �.+��� $��User Management��$��0��$��32(�$��SemiBold"�
���   �$��0 0 0 20q�� $��1��$��	0 10 0 10q� � ColumnDefinitions �� $��* ��� $
��Auto �.+��� -    ��Name$ 	txtSearch��$	��250��   textboxSearch#��[  $��Right=���  �� Text$ Filter��$��1��$	��120��$��30��$��10 0 0 0q�.@��� $��	All Users���� $��Admin���� $��Manager���� $��Staff���� $��Viewer���� $��2�� �� Orientation$ 
Horizontal=�$��	0 10 0 10q�.+��� $��Sort by:��$��16(�$��Center=�$��0 0 10 0q��� $	��150�� �� SelectedIndex$ 0��.@��� $��Username���� $
��Role��&   System.Windows.Controls.DataGrid  -     Name$ dgUsers��$��3��   AutoGenerateColumns$ False��   HeadersVisibility$ Column=�	   CanUserAddRows$	 False��
   
IsReadOnly$

 True��
�������$��1q�
�������$��0 0 0 10q����� *
UserList+   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Username��   Width5  /System.Windows.Controls.DataGridLengthConverter$ * 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *
Username+  $
 Role��$	 150  �� *Role+4  .System.Windows.Controls.DataGridTemplateColumn  $ Actions��$	 120    CellTemplate �� .R��� $ 
Horizontal=�.+��� $
��Edit��  
editButton#��[ $��2q��� $��Delete��  deleteButton#��[ $��2q��� $��4��$��Right=�
�������$��1q� �� CornerRadius$ 5�� �� Padding$ 5q�
�������$��
0 10 10 10q�._��� $ 
Horizontal=�.+���   pagingButton#��[ .��.  (MahApps.Metro.IconPacks.PackIconMaterial     Kind$ ChevronLeft=�  pagingButtonIcon#��[ �� $��1��
�������$	��3 7q��� #��[ $��1���� #��[ $��2���� #��[ $��3���� $	��...��
�������$��Center=�$��15(�$
��10 0q��� #��[ $��9���� $��1��
�������$	��3 7q��� #��[ .��  $ ChevronRight=�#��[ �� $��5��
�������
�������$��1q�$ 5��$ 10q�$��0 10 0 0q�._��� $ Vertical=�.+��� $��Add / Edit User��$��18(�$
��Bold"�$��0 0 0 10q��� $ 
Horizontal=�$��0 0 0 5q�.+��� $��	Username:��$	��100��$��Center=��� -   $ UsernameTextBox��$	��200���� $ 
Horizontal=�$��0 0 0 5q�.+��� $��	Password:��$	��100��$��Center=�G� -    G�Name$ PasswordBox��$	��200���� $ 
Horizontal=�$��0 0 0 10q�.+��� $��Role:��$	��100��$��Center=��� -    ��Name$ RoleComboBox��$	��200��.@��� $��Admin���� $��Manager���� $��Staff���� $��Viewer���� $ 
Horizontal=�$��Center=�$��10 0 0 0q�.+��� $��Add User��  
saveButton#��[ $	��120��$��5q��� $��Update User��  
EditButton#��[ $	��120��$��5q�