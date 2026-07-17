import streamlit as st
import pandas as pd
import joblib

model = joblib.load("music_genre_classifier.joblib")
scaler = joblib.load("audio_scaler.joblib")


st.set_page_config(
    page_title="Music Genre AI"
)


st.title(" AI Music Genre Classification")

st.write(
    "Upload a CSV file containing audio features "
    "to predict music genres."
)


uploaded_file = st.file_uploader(
    "Upload Song Feature CSV",
    type=["csv"]
)


if uploaded_file:

    data = pd.read_csv(uploaded_file)

    st.subheader("Uploaded Songs")
    st.dataframe(data)


    required_features = [
        "tempo",
        "energy",
        "danceability"
    ]


    if all(
        col in data.columns
        for col in required_features
    ):

        X = data[required_features]

        X_scaled = scaler.transform(X)


        predictions = model.predict(X_scaled)
        probabilities = model.predict_proba(X_scaled)

        confidence = (
            probabilities.max(axis=1) * 100
        )

        data["Predicted Genre"] = predictions
        data["Confidence (%)"] = confidence.round(2)


        st.subheader("Prediction Results")

        st.dataframe(data)


        st.subheader(" Prediction Summary")

        summary = (
            data["Predicted Genre"]
            .value_counts()
        )

        st.bar_chart(summary)


        st.success(
            f"Total Songs Predicted: {len(data)}"
        )


    else:
        st.error(
            "CSV must contain: tempo, energy, danceability"
        )