import streamlit as st
import pandas as pd
import joblib


model = joblib.load("music_genre_classifier.joblib")
scaler = joblib.load("audio_scaler.joblib")

st.title("Music Genre Classification System")

st.write(
    "Upload a CSV file containing audio features "
    "to predict the genre of each song."
)

uploaded_file = st.file_uploader(
    "Upload CSV File",
    type=["csv"]
)


if uploaded_file is not None:
    data = pd.read_csv("song_features.csv")

    st.subheader("Uploaded Audio Features")

    st.dataframe(data)
    feature_columns = [
        "tempo",
        "energy",
        "danceability"
    ]


    if all(col in data.columns for col in feature_columns):
        X = data[feature_columns]


        X_scaled = scaler.transform(X)


        predictions = model.predict(X_scaled)


        data["Predicted Genre"] = predictions


        st.subheader("Prediction Results")

        st.dataframe(data)



        csv = data.to_csv(index=False).encode("utf-8")

        st.download_button(
            label="Download Predictions",
            data=csv,
            file_name="music_genre_predictions.csv",
            mime="text/csv"
        )


    else:
        st.error(
            "CSV must contain columns: tempo, energy, danceability"
        )