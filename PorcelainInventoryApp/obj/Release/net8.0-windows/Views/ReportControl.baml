   M S B A M L   `   `   `  ���� P  LPorcelainInventoryApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:PorcelainInventoryApp.ViewsPorcelainInventoryApp.Views  /    )PorcelainInventoryApp.Views.ReportControl   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   <d2http://schemas.microsoft.com/expression/blend/2008   7local)clr-namespace:PorcelainInventoryApp.Views   .��� $��20q�  � RowDefinitions  �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��* �.+��� $��Sales and Reports��$��0��$��28(�$��SemiBold"�
���   �$��0 0 0 20q�� $��1��$��	0 10 0 10q� � ColumnDefinitions �� $��* ��� $
��Auto �.+���  �� Orientation$ 
Horizontal=�$��Center=�.+��� $��
Filter by:��$��14(�$��Center=�$��0 0 10 0q�(  "System.Windows.Controls.DatePicker  $	��150��$��0 0 10 0q�   SelectedDate �� *	StartDate+ �� Mode$ TwoWay=�  $	��150��$��0 0 10 0q� �� *	EndDate+$ TwoWay=��� $	��150�� �� SelectedItem �� *SelectedCategory+$ TwoWay=�.@��� $��All Categories���� $��Porcelain Vases���� $��
Dinnerware���� $��Decorative Items���� $��Apply Filter��$��10 0 0 0q����� *ApplyFilterCommand+�� $��1��   exportButton#��[  $��10 0 0 0q����� *ExportReportCommand+.���� $ 
Horizontal=�.+�.  (MahApps.Metro.IconPacks.PackIconMaterial     Kind$ 
FileExport=�$��16��$��16��$��0 1 8 0q��� $��Export Report��� $��2��$��	0 10 0 10q� �� $��* ��� $��* ��� $��* �.+��� $��0��
�������$��1q� �� CornerRadius$ 5�� �� Padding$ 10q�$��5q�._��� $��Center=�.+��� $��Total Sales��$��16(�$
��Bold"�	 �� TextAlignment$	 Center=��� $��24(�$��SemiBold"�
��� � �$	 Center=����� *
TotalSales+
 �� StringFormat$
 	₱{0:N2}���� $��1��
�������$��1q�$ 5��$ 10q�$��5q�._��� $��Center=�.+��� $��Total Customers��$��16(�$
��Bold"�$	 Center=��� $��24(�$��SemiBold"�
����  �$	 Center=����� *TotalCustomers+�� $��2��
�������$��1q�$ 5��$ 10q�$��5q�._��� $��Center=�.+��� $��Best-Selling Product��$��16(�$
��Bold"�$	 Center=��� $��18(�$��SemiBold"�$	 Center=����� *BestSellingProduct+�� $��4��
�������$��1q�$ 5��$ 10q�._�&   System.Windows.Controls.DataGrid  -     Name$ dgSales��   AutoGenerateColumns$ False��   HeadersVisibility$ Column=�   CanUserAddRows$ False��   
IsReadOnly$
 True��
����������� *SalesReports+ �� UpdateSourceTrigger$ PropertyChanged=�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Invoice No.��   Width5  /System.Windows.Controls.DataGridLengthConverter$ * 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *	InvoiceID+  $ Customer��$ *  �� *Customer.FullName+  $ Total Amount��$ *  �� *TotalAmount+$
 	₱{0:N2}��  $
 Date��$ *  �� *
DateIssued+