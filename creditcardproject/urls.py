"""
URL configuration for creditcardproject project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from mainapp import views as mainappviews
from userapp import views as userappviews
from adminapp import views as adminappviews
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    #user
    path('admin/', admin.site.urls),
    path('',mainappviews.main_home,name='main_home'),
    path('user-login',mainappviews.user_login,name='user_login'),
    path('admin-login',mainappviews.admin_login,name='admin_login'),
    path('aboutus',mainappviews.aboutus,name='aboutus'),
    path('contactus',mainappviews.contactus,name='contactus'),
    path('register',mainappviews.register,name='register'),
    path('otp',mainappviews.otp,name='otp'),
    path('forgot-password',mainappviews.forgot_password,name='forgot_password'),
    #main
    path('user-dashboard', userappviews.user_dashboard,name='user_dashboard'),
    path('user-profile', userappviews.user_profile,name='user_profile'),
    path('user-feedback', userappviews.user_feedback,name='user_feedback'),
    path('user-predict', userappviews.user_predict,name='user_predict'),
    path('predict-result',userappviews.predict_result,name='predict_result'),
    path('userlogout',userappviews.userlogout, name = 'userlogout'),
    #admin
    path('admin-dashboard',adminappviews.admin_dashboard,name='admin_dashboard'),
    path('admin-pending-users',adminappviews.admin_pending_users,name='admin_pending_users'),
    path('admin-all-users',adminappviews.admin_all_users,name='admin_all_users'),
    path('admin-graph',adminappviews.admin_graph,name='admin_graph'),
    path('admin-upload',adminappviews.admin_upload,name='admin_upload'),
    path('admin-view',adminappviews.admin_view,name='admin_view'),
    path('view_view', adminappviews.view_view, name='view_view'),
    path('delete-dataset/<int:id>',adminappviews.delete_dataset, name = 'delete_dataset'),
    path('accept-user/<int:id>', adminappviews.accept_user, name = 'accept_user'),
    path('reject-user/<int:id>', adminappviews.reject_user, name = 'reject'),
    path('delete-user/<int:id>', adminappviews.delete_user, name = 'delete_user'),
    path('admin-Xg_algo',adminappviews.admin_Xg_algo,name='admin_Xg_algo'),
    path('admin-ada_algo',adminappviews.admin_ada_algo,name='admin_ada_algo'),
    path('admin-Logistic-algo',adminappviews.admin_Logistic_algo,name='admin_Logistic_algo'),
    path('admin-knn-algo',adminappviews.admin_knn_algo,name='admin_knn_algo'),
    path('admin-Randomforest-algo',adminappviews.admin_Randomforest_algo,name='admin_Randomforest_algo'),
    path('admin-greadient-algo',adminappviews.admin_greadient_algo,name='admin_greadient_algo'),
    path('admin-dt-algo',adminappviews.admin_dt_algo,name='admin_dt_algo'),
    path('XGBOOST_btn', adminappviews.XGBOOST_btn, name='XGBOOST_btn'),
    path('ADABoost_btn', adminappviews.ADABoost_btn, name='ADABoost_btn'),
    path('KNN_btn', adminappviews.KNN_btn, name='KNN_btn'),
    path('GR_btn', adminappviews.GR_btn, name='GR_btn'),
    path('logistic_btn', adminappviews.logistic_btn, name='logistic_btn'),
    path('randomforest_btn', adminappviews.randomforest_btn, name='randomforest_btn'),
    path('Decisiontree_btn', adminappviews.Decisiontree_btn, name='Decisiontree_btn'),
    path('user-feedbacks',adminappviews.user_feedbacks,name='user_feedbacks'),
    path('user-sentiment',adminappviews.user_sentiment,name='user_sentiment'),
    path('user-graph',adminappviews.user_graph,name='user_graph'),
    path('admin-logout', adminappviews.admin_logout, name='admin_logout'),
] + static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)
