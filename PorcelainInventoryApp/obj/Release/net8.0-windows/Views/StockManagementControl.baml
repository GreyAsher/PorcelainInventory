   M S B A M L   `   `   `  ���� P  LPorcelainInventoryApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:PorcelainInventoryApp.ViewsPorcelainInventoryApp.Views  8    2PorcelainInventoryApp.Views.StockManagementControl   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   <d2http://schemas.microsoft.com/expression/blend/2008   7local)clr-namespace:PorcelainInventoryApp.Views   .��� $��20q�  � RowDefinitions  �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��* ��� $
��Auto �.+��� $��Stock Management��$��0��$��32(�$��SemiBold"�
���   �$��0 0 0 20q�� $��1��$��	0 10 0 10q� � ColumnDefinitions �� $��* ��� $	��250 �.+��� $��0�� �� Orientation$ 
Horizontal=�.+��� $��	Sort by: ��$��16(�$��Center=�$��0 0 10 0q��� -    ��Name$ SortComboBox��$	��150�� �� SelectedIndex$ 0��$��25��.@��� $
��Name���� $��Stock Quantity���� $��Last Updated��� $��1��.+��� -    ��Name$ 	txtSearch��   textboxSearch#��[  &   System.Windows.Controls.DataGrid  -     Name$ dgStockItems��$��3��   AutoGenerateColumns$ False��$
��True��$��10(�   HeadersVisibility$ Column=�	   CanUserAddRows$	 False��
   
IsReadOnly$

 True��
�������$��1q�
�������$��0 0 0 10q����� *
Products+   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Product Name��   Width5  /System.Windows.Controls.DataGridLengthConverter$ * 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *ProductName+4  .System.Windows.Controls.DataGridTemplateColumn  $ Stock��$ *    CellTemplate �� .R��� $
��Bold"����� *StockQuantity+����  �� 
TargetType" ��.���  �� Property � �� �� Value
 � � � �� Triggers ��  �� Binding �� *StockQuantity+ �� Value 0.a���  � ��
 �  ��  $ Stock Status��$ *  �� .R��� $
��Bold"����� *StockStatus+���� " ��.���  � ��
 �   � ��  �� *StockStatus+ Out of Stock.a���  � ��
 �  ����  �� *StockStatus+ In Stock.a���  � ��
 � � �  $ Last Updated��$ *  �� *DateUpdated+  $ Actions��$	 140  �� .R��� $ 
Horizontal=�.+��� -   $��	Add Stock��  editStockButton#��[ $��2q�