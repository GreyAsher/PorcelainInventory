   M S B A M L   `   `   `  ����   PorcelainInventoryApp?    9PorcelainInventoryApp.Views.ViewWindows.InvoiceInfoWindow   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks     � Title$  Invoice Receipt�� � WindowStartupLocation$ CenterScreen=�$	��500��$	��600��
�������
�������$��1q� � 
ResizeMode$ NoResize=�.��� $��20q� � RowDefinitions �� $
��Auto ��� $
��Auto ��� $��* ��� $
��Auto �.+�]� $��0��$��0,0,-250,10q�.+��� $��Invoice Receipt��$��24(�$��SemiBold"�
���   �$
��Left=��� -   $��30��$��30��$��Right=�
������ $��0q� � ToolTip$ Print��.��.  (MahApps.Metro.IconPacks.PackIconMaterial     Kind$ Printer=�$��20��$��20��
���   ��� $��1�� �� Orientation$ Vertical=�$��0,0,0,10q�.+��� $��Customer Name: ��$
��Bold"��� -    ��Name$ txtCustomerName��$��0,0,0,5q��� $��Date Purchased: ��$
��Bold"��� -   $ txtDatePurchased��&   System.Windows.Controls.DataGrid  -     Name$ dgInvoiceProducts��$��2��	   AutoGenerateColumns$	 False��
   HeadersVisibility$
 Column=�   
IsReadOnly$
 True��   CanUserResizeColumns$ False��   CanUserReorderColumns$ False��   CanUserAddRows$ False��$��	0,10,0,10q�$��0q�   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Product Name��   Width5  /System.Windows.Controls.DataGridLengthConverter$ * 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *ProductName+  $ Quantity��$ 80  �� *
Quantity+  $ Price��$	 100  �� *Price+ �� StringFormat$ 	₱{0:N2}���� $��3��$ 
Horizontal=�$��Right=�$��0,10,0,0q�.+��� $��Total Amount:��$��16(�$
��Bold"�$��Center=��� -   $ txtTotalAmount��$
��0.00��$��16(�$
��Bold"�
��� � �$��10,0,0,0q�