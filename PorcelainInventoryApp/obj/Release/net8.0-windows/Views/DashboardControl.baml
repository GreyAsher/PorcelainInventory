   M S B A M L   `   `   `  ���� [  WLiveChartsCore.SkiaSharpView.WPF, Version=2.0.0.0, Culture=neutral, PublicKeyToken=null}Xclr-namespace:LiveChartsCore.SkiaSharpView.WPF;assembly=LiveChartsCore.SkiaSharpView.WPF LiveChartsCore.SkiaSharpView.WPF   PorcelainInventoryApp2   ,PorcelainInventoryApp.Views.DashboardControl   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     c _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ag cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:Icon-http://metro.mahapps.com/winfx/xaml/iconpacks   Fmc;http://schemas.openxmlformats.org/markup-compatibility/2006   <d2http://schemas.microsoft.com/expression/blend/2008   dlvcXclr-namespace:LiveChartsCore.SkiaSharpView.WPF;assembly=LiveChartsCore.SkiaSharpView.WPF   .��� $��20q�  � RowDefinitions  �� $
��Auto ��� $
��Auto ��� $��* �.+��� $��Dashboard Overview��$��32(�$��SemiBold"�$
��Left=�
���   �$��0 0 0 20q�� $��1��$��	0 10 0 20q� � ColumnDefinitions �� $��* ��� $��* ��� $��* ��� $��* �.+��� ���#3498db �� Padding$ 20q� �� CornerRadius$ 10��$��0��$��5q�._��� .+�.  (MahApps.Metro.IconPacks.PackIconMaterial     Kind$ CurrencyUsd=�$��30��$��30��
��������� $��Total Sales��
�������$��14(��� 
�������$��22(�$
��Bold"����� *
TotalSales+ �� StringFormat$ 	₱{0:N2}���� ���#2ecc71$ 20q�$ 10��$��1��$��5q�._��� .+�  $ PackageVariant=�$��30��$��30��
��������� $��Total Products��
�������$��14(��� 
�������$��22(�$
��Bold"����� *TotalProducts+�� ���#e74c3c$ 20q�$ 10��$��2��$��5q�._��� .+�  $ AlertCircle=�$��30��$��30��
��������� $��Out of Stock��
�������$��14(��� 
�������$��22(�$
��Bold"����� *
OutOfStock+�� ���#f39c12$ 20q�$ 10��$��3��$��5q�._��� .+�  $ TruckDelivery=�$��30��$��30��
��������� $��	Suppliers��
�������$��14(��� 
�������$��22(�$
��Bold"����� *	Suppliers+� $��2�� �� $��2* ��� $��1* �.+��� 
�������
�������$��1q�$ 10��$��0��$��5q�$ 10q�._��   �� $
��Auto ��� $��* �.+��� $!��Sales Trend (Last 6 Months)��$��18(�$��SemiBold"�$��5q�5   /LiveChartsCore.SkiaSharpView.WPF.CartesianChart  $��1��$��10q�$��Segoe UI)�   Series �� *SalesTrendSeries+   XAxes �� *SalesTrendXAxes+   YAxes �� *SalesTrendYAxes+�� 
�������
�������$��1q�$ 10��$��6,5,6,5q�$ 10q�$��1��._��� .+��� $��Best Selling Products��$��18(�$��SemiBold"�$��5q��� $��12(�$��0q����� *BestSellingProducts+