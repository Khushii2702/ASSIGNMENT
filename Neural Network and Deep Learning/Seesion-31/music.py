import streamlit as st
import pandas as pd
import joblib


model = joblib.load("music_genre_classifier.joblib")
scaler = joblib.load("audio_scaler.joblib")


st.set_page_config(
    page_title="AI Music Genre Predictor",
    page_icon="🎵"
)

st.title(" AI Music Genre Prediction")
st.write(
    "Enter audio features of a song and get "
    "instant genre prediction with confidence."
)


tempo = st.number_input(
    "Tempo (BPM)",
    min_value=40,
    max_value=220,
    value=120
)


energy = st.slider(
    "Energy Level",
    min_value=0.0,
    max_value=1.0,
    value=0.7
)


danceability = st.slider(
    "Danceability",
    min_value=0.0,
    max_value=1.0,
    value=0.6
)

if st.button("Predict Genre "):

    song_features = pd.DataFrame({
        "tempo": [tempo],
        "energy": [energy],
        "danceability": [danceability]
    })


    scaled_features = scaler.transform(song_features)

    prediction = model.predict(scaled_features)

    probability = model.predict_proba(
        scaled_features
    )


    confidence = max(probability[0]) * 100


    st.success(
        f"Predicted Genre: {prediction[0]}"
    )


    st.info(
        f"Confidence Score: {confidence:.2f}%"
    )

    st.subheader("Genre Probability Distribution")

    genres = model.classes_

    probability_df = pd.DataFrame({
        "Genre": genres,
        "Probability (%)":
            probability[0] * 100
    })


    probability_df = probability_df.sort_values(
        by="Probability (%)",
        ascending=False
    )


    st.dataframe(
        probability_df
    )

    st.bar_chart(
        probability_df.set_index("Genre")
    )