   M S B A M L   `   `   `  ����  PorcelainInventoryApp1    +PorcelainInventoryApp.Views.CompUserControl   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   5      <d2http://schemas.microsoft.com/expression/blend/2008   5      .��5
      � $��20q�6     � RowDefinitions  5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   .+�5   
   �� $��User Management��6   $��0��6+   $��32(�68   $��SemiBold"�6F   
���   �$��0 0 0 20q�6o   � 5   
   $��1��6   $��	0 10 0 10q�6    � ColumnDefinitions 5      �� 5       $��* �6#   �� 5!      $
��Auto �6#   .+�5$      �� -   5         ��Name$ 	txtSearch��5$      $	��250��6)      textboxSearch#��[  65   $��Right=�6\   �� 5%       �� Text$ Filter��6   $��1��6%   $	��120��65   $��30��6A   $��10 0 0 0q�6M   .@�5&      �� $��	All Users��6   �� 5'      $��Admin��6   �� 5(      $��Manager��6   �� 5)      $��Staff��6   �� 5*      $��Viewer��6   5+      5,      �� 5/   
   $��2��6    �� Orientation$ 
Horizontal=�6"   $��	0 10 0 10q�6;   .+�50      �� $��Sort by:��6   $��16(�6(   $��Center=�66   $��0 0 10 0q�6Q   �� 51      $	��150��6    �� SelectedIndex$ 0��6#   .@�52      �� $��Username��6   �� 53      $
��Role��6   54      55      &   System.Windows.Controls.DataGrid  58   
   -   5          Name$ dgUsers��58      $��3��6$      AutoGenerateColumns$ False��61      HeadersVisibility$ Column=�59      	   CanUserAddRows$	 False��6.   
   
IsReadOnly$

 True��6E   
�������$��1q�5:   &   
�������$��0 0 0 10q�6M   ��5;      �� *
UserList+   Columns 5=      0  *System.Windows.Controls.DataGridTextColumn  5>      ,  &System.Windows.Controls.DataGridColumn   Header$ Username��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6T   1  +System.Windows.Controls.DataGridBoundColumn   Binding 67   �� *
Username+6T     5?      $
 Role��6%   $	 150 6L    63   �� *Role+6L   4  .System.Windows.Controls.DataGridTemplateColumn  5B      $ Actions��6)   $	 120 6:      CellTemplate 5C      �� 5D      .R�5E      �� $ 
Horizontal=�6)   .+�5F   "   �� $
��Edit��6)     
editButton#��[ 68   $��2q�6\   �� 5G   "   $��Delete��6)     deleteButton#��[ 6:   $��2q�6`   5H      5I      5K      5M      �� 5P   
   $��4��6   $��Right=�6   
�������$��1q�5Q       �� CornerRadius$ 5��6%    �� Padding$ 5q�66   
�������$��
0 10 10 10q�5R      ._�5S      �� $ 
Horizontal=�6   .+�5T      ��   pagingButton#��[ 6   .��5U      .  (MahApps.Metro.IconPacks.PackIconMaterial     Kind$ ChevronLeft=�6,     pagingButtonIcon#��[ 6?   5V      �� 5W      $��1��6   
�������$	��3 7q�62   �� 5X      #��[ 6   $��1��6?   �� 5Y      #��[ 6   $��2��6?   �� 5Z      #��[ 6   $��3��6?   �� 5[      $	��...��6   
�������$��Center=�69   $��15(�6T   $
��10 0q�6b   �� 5\      #��[ 6   $��9��6?   �� 5]      $��1��6   
�������$	��3 7q�62   �� 5^      #��[ 6   .��5_        $ ChevronRight=�6,   #��[ 6@   5`      5a      5b      �� 5e   
   $��5��6   
�������
�������$��1q�6D   $ 5��6X   $ 10q�6i   $��0 10 0 0q�6v   ._�5f      �� $ Vertical=�6   .+�5g      �� $��Add / Edit User��6   $��18(�63   $
��Bold"�6A   $��0 0 0 10q�6S   �� 5i      $ 
Horizontal=�6   $��0 0 0 5q�66   .+�5j      �� $��	Username:��6    $	��100��61   $��Center=�6=   �� 5k      -   5        $ UsernameTextBox��5k      $	��200��67   5l      �� 5n      $ 
Horizontal=�6   $��0 0 0 5q�66   .+�5o      �� $��	Password:��6    $	��100��61   $��Center=�6=   G� 5p      -   5         G�Name$ PasswordBox��5p   "   $	��200��67   5q      �� 5s      $ 
Horizontal=�6   $��0 0 0 10q�66   .+�5t      �� $��Role:��6    $	��100��6-   $��Center=�69   �� 5u      -   5         ��Name$ RoleComboBox��5u      $	��200��65   .@�5v      �� $��Admin��6'   �� 5w      $��Manager��6'   �� 5x      $��Staff��6'   �� 5y      $��Viewer��6'   5z      5{      �� 5~      $ 
Horizontal=�6   $��Center=�66   $��10 0 0 0q�6S   .+�5      �� $��Add User��6     
saveButton#��[ 60   $	��120��6T   $��5q�6`   �� 5�      $��Update User��6     
EditButton#��[ 63   $	��120��6W   $��5q�6c   5�      5�      5�      5�      5�      