   M S B A M L   `   `   `  ���� P  LPorcelainInventoryApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:PorcelainInventoryApp.ViewsPorcelainInventoryApp.Views  1    +PorcelainInventoryApp.Views.CustomerControl   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   <d2http://schemas.microsoft.com/expression/blend/2008   7local)clr-namespace:PorcelainInventoryApp.Views   .��� $��20q�  � RowDefinitions  �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��* ��� $
��Auto �.+��� $��Customer Management��$��0��$��32(�$��SemiBold"�$��0 0 0 20q�� $��1��$��	0 10 0 10q� � ColumnDefinitions �� $
��Auto ��� $��* �.+��� -   $��0��   	addButton#��[  $��0 0 10 0q�.����  �� Orientation$ 
Horizontal=�.+�.  (MahApps.Metro.IconPacks.PackIconMaterial     Kind$ 
PlusCircle=�$��16��$��16��$��0 1 8 0q��� $��Add Customer��� $��1��$	��250��$��Right=�.+��� -    ��Name$ 	txtSearch��  textboxSearch#��[ ���� *
SearchText+ �� UpdateSourceTrigger$ PropertyChanged=��� $��2��$ 
Horizontal=�$��	0 10 0 10q�.+��� $��Sort by:��$��16(�$��Center=�$��0 0 10 0q��� $	��150�� �� SelectedItem �� *
SortOption+.@��� $
��Name���� $��Last Purchase���� $��
Date Added��&   System.Windows.Controls.DataGrid  -     Name$ dgCustomers��$��3��   AutoGenerateColumns$ False��$��10(�	   HeadersVisibility$	 Column=�
   CanUserAddRows$
 False��   
IsReadOnly$
 True��
�������$��1q�
�������$��0 0 0 10q����� *	Customers+$ PropertyChanged=�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Customer Name��   Width5  /System.Windows.Controls.DataGridLengthConverter$ * 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *
FullName+  $ Email��$ *  �� *Email+  $ Phone��$ *  �� *ContactNumber+4  .System.Windows.Controls.DataGridTemplateColumn  $ Actions��$ *    CellTemplate �� .R��� $ 
Horizontal=�.+��� -   $
��Edit��  
editButton#��[ $��2q����� *EditCommand+�� -   $��Delete��  deleteButton#��[ $��2q����� *DeleteCommand+