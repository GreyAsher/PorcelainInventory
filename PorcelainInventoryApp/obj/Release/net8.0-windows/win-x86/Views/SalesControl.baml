   M S B A M L   `   `   `  ���� P  LPorcelainInventoryApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:PorcelainInventoryApp.ViewsPorcelainInventoryApp.Views  .    (PorcelainInventoryApp.Views.SalesControl   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   <d2http://schemas.microsoft.com/expression/blend/2008   7local)clr-namespace:PorcelainInventoryApp.Views   .��� $��20q�  � RowDefinitions  �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��* ��� $
��Auto �.+��� $��Sales Transactions��$��0��$��32(�$��SemiBold"�
���   �$��0 0 0 20q�� $��1��$��	0 10 0 10q� � ColumnDefinitions �� $
��Auto ��� $
��Auto ��� $��* �.+��� -   $��0��   addInvoiceButton#��[  $��0 0 10 0q�.����  �� Orientation$ 
Horizontal=�.+�.  (MahApps.Metro.IconPacks.PackIconMaterial     Kind$ FileDocument=�$��11��$��11��$��0 1 8 0q��� $��New Invoice��� $��2��$	��250��$��Right=�.+��� -    ��Name$ 	txtSearch��  textboxSearch#��[ �� $��2��$ 
Horizontal=�$��	0 10 0 10q�.+��� $��Sort by:��$��16(�$��Center=�$��0 0 10 0q��� $	��150�� �� SelectedIndex$ 0��.@��� $
��Date���� $��Total Amount���� $��Customer Name���� $��Payment Method��&   System.Windows.Controls.DataGrid  -     Name$ dgSales��$��3��   AutoGenerateColumns$ False��$��15(�$
��True��   HeadersVisibility$ Column=�	   CanUserAddRows$	 False��
   
IsReadOnly$

 True��
�������$��1q�
�������$��0 0 0 10q����� *
Invoices+ �� UpdateSourceTrigger$ PropertyChanged=�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Transaction ID��   Width5  /System.Windows.Controls.DataGridLengthConverter$ * 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *	InvoiceID+4  .System.Windows.Controls.DataGridTemplateColumn  $ Actions��$
 auto    CellTemplate �� .R��� $ 
Horizontal=�.+��� -   $��	View Info��  viewInvoiceButton#��[ $��2q�