from django.shortcuts import render,redirect
from mainapp.models import *
from userapp.models import *
from adminapp.models import *
from django.contrib import messages
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer
from django.core.files.storage import default_storage
import pytz
from datetime import datetime
import pickle
import pandas as pd
import time
from sklearn.metrics import accuracy_score,classification_report
# Create your views here.
def user_dashboard(req):
    prediction_count = UserModel.objects.all().count()
    print(prediction_count)
    user_id = req.session["user_id"]
    user = UserModel.objects.get(user_id = user_id)
    
    if user.Last_Login_Time is None:
        IST = pytz.timezone('Asia/Kolkata')
        current_time_ist = datetime.now(IST).time()
        user.Last_Login_Time = current_time_ist
        user.save()
    return render(req,'user/user_dashboard.html', {'predictions' : prediction_count, 'la' : user})
def user_profile(req):
    user_id = req.session["user_id"]
    user = UserModel.objects.get(user_id = user_id)
    if req.method == 'POST':
        user_name = req.POST.get('userName')
        user_age = req.POST.get('userAge')
        user_phone = req.POST.get('userPhNum')
        user_email = req.POST.get('userEmail')
        user_address = req.POST.get("userAddress")
        
        # user_img = request.POST.get("userimg")

        user.user_name = user_name
        user.user_age = user_age
        user.user_address = user_address
        user.user_contact = user_phone
        user.user_email=user_email
       

        if len(req.FILES) != 0:
            image = req.FILES['profilepic']
            user.user_image = image
            user.user_name = user_name
            user.user_age = user_age
            user.user_contact = user_phone
            user.user_email=user_email
            user.user_address = user_address
            user.save()
            messages.success(req, 'Updated SUccessfully...!')
        else:
            user.user_name = user_name
            user.user_age = user_age
            user.save()
            messages.success(req, 'Updated SUccessfully...!')
            
    context = {"i":user}
    return render(req,'user/user_profile.html', context)
def user_feedback(req):
    id=req.session["user_id"]
    uusser=UserModel.objects.get(user_id=id)
    if req.method == "POST":
        rating=req.POST.get("rating")
        review=req.POST.get("review")
        # print(sentiment)        
        # print(rating)
        sid=SentimentIntensityAnalyzer()
        score=sid.polarity_scores(review)
        sentiment=None
        if score['compound']>0 and score['compound']<=0.5:
            sentiment='positive'
        elif score['compound']>=0.5:
            sentiment='very positive'
        elif score['compound']<-0.5:
            sentiment='negative'
        elif score['compound']<0 and score['compound']>=-0.5:
            sentiment=' very negative'
        else :
            sentiment='neutral'
        Feedback.objects.create(Rating=rating,Review=review,Sentiment=sentiment,Reviewer=uusser)
        messages.success(req,'Feedback recorded')
        return redirect('user_feedback')
    return render(req,'user/user_feedback.html')

import folium
from folium.plugins import AntPath
def user_predict(req):
    if req.method == 'POST':
        age = req.POST.get('age')
        gender = req.POST.get('gender')
        category = req.POST.get('category')
        amt = req.POST.get('amt')
        trans_month = req.POST.get('trans_month')
        trans_year = req.POST.get('trans_year')
        lat_dis = req.POST.get('lat_dis')
        long_dis = req.POST.get('long_dis')
        merch_lat_dis = float(req.POST.get('merch_lat_dis'))
        merch_long_dis = float(req.POST.get('merch_long_dis'))
        age = int(age)
        print(age,gender,category,amt,trans_month,trans_year,lat_dis,long_dis)
        if gender == '0':  
            sex = "female"
        else:
            sex = "male"
        context = {'gender': sex}
        category =int(category)
        trans_year = int(trans_year)
        amt = float(amt)
        lat_dis = float(lat_dis)
        long_dis = float(long_dis)
        import pickle
        file_path = 'Credit_card_fraud_transaction/rfc_credit1.pkl'

        with open(file_path, 'rb') as file:
            loaded_model = pickle.load(file)
            res =loaded_model.predict([[category,	amt,	gender,	age,	trans_month,	trans_year,	lat_dis,long_dis]])
            # res=loaded_model.predict([[12,	776.21,	0,	17,	5,	2019,	0.173071,	0.727429]]) #1
            # res=loaded_model.predict(([[4,	119.82	,1	,	53,	6,	2019,	0.422473,	0.176732]])) #0
            
            
            
            print(res,'tttttttttttttttttttttttttttttttttttttttttttt')
            												

            dataset = Upload_dataset_model.objects.last()
            df=pd.read_csv(dataset.Dataset.path)
            

            x = df.drop('is_fraud', axis = 1)
            y = df['is_fraud']
            import imblearn
            from imblearn.over_sampling import SMOTE
            ros = SMOTE()  # You need to add parentheses to create an instance
            X_oversample, y_oversample = ros.fit_resample(x, y)
            print(X_oversample.shape)
            print(y_oversample.shape)

            from sklearn.model_selection import train_test_split
            x_train,x_test,y_train,y_test = train_test_split(x,y,test_size = 0.2,random_state =42)


            from sklearn.ensemble import RandomForestClassifier

            rfc=RandomForestClassifier(random_state=42)
            rfc.fit(x_train,y_train)
            print('*'*20)

            # prediction
            test_prediction= rfc.predict(x_test)
            print('*'*20)

            # evaluation
            from sklearn.metrics import accuracy_score
            print('test accuracy:',accuracy_score(y_test,test_prediction))
            print('*'*20)

     

            #  prediction Summary by species
            print(classification_report(y_test, test_prediction))
            print('*'*20)

            # Accuracy score
            RF_SC = accuracy_score(test_prediction,y_test)
            print(f"{round(RF_SC*100,2)}% Accurate")

            # evaluation
            from sklearn.metrics import accuracy_score,precision_score,recall_score,f1_score
            accuracy = round(accuracy_score(y_test,test_prediction)*100, 2)
            precession = round(precision_score(test_prediction,y_test,average = 'macro')*100, 2)
            recall = round(recall_score(test_prediction,y_test,average = 'macro')*100, 2)
            f1_score = round(f1_score(test_prediction,y_test,average = 'macro')*100, 2)
            print(precession, accuracy,recall,f1_score,'uuuuuuuuuuuuuuuuuuuuuuuuuuu')
            x=0
            if res[0] == 0:
                x=0
                messages.success(req, "Credit Card fraud Not Detected.")
            else:
                x=1
                messages.warning(req, "Credit Card fraud Detected.")
            

            # Create a Folium map centered between both locations
            m = folium.Map(location=[(lat_dis + merch_lat_dis) / 2, (long_dis + merch_long_dis) / 2], zoom_start=10)

            # Add markers for the locations
            folium.Marker([lat_dis, long_dis], popup=f'Lat: {lat_dis}, Long: {long_dis}').add_to(m)
            folium.Marker([merch_lat_dis, merch_long_dis], popup=f'Lat: {merch_lat_dis}, Long: {merch_long_dis}').add_to(m)

            # Create an AntPath between the two locations
            locations = [[lat_dis, long_dis], [merch_lat_dis, merch_long_dis]]
            ant_path = AntPath(locations, color='red')
            ant_path.add_to(m)

            # Generate the HTML representation of the map
            map_html = m._repr_html_()


            context = {'accc': accuracy,'pre': precession,'f1':f1_score,'call':recall,'res':x , 'lat_dis': lat_dis,
            'long_dis': long_dis,'merch_lat_dis':merch_lat_dis,'merch_long_dis':merch_long_dis,'map_html': map_html}
            return render(req, 'user/user_result.html',context)
    return render(req,'user/user_prediction.html')


def predict_result(req):
    return render(req,'user/user_result.html')

def userlogout(request):
    user_id = request.session["user_id"]
    user =UserModel.objects.get(user_id = user_id)
    t = time.localtime()
    user.Last_Login_Time = t
    current_time = time.strftime('%H:%M:%S', t)
    user.Last_Login_Time = current_time
    current_date = time.strftime('%Y-%m-%d')
    user.Last_Login_Date = current_date
    user.save()
    messages.info(request, 'You are logged out..')
    return redirect('user_login')


