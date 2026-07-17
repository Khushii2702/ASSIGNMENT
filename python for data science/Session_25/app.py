import requests
import schedule
import time
import pandas as pd


BINANCE_URL = (
    "https://api.binance.com/api/v3/ticker/price"
)



SYMBOL = "BTCUSDT"

MAX_RETRIES = 5


def fetch_binance_data():

    retry_count = 0


    while retry_count < MAX_RETRIES:

        try:

            response = requests.get(
                BINANCE_URL,
                params={"symbol": SYMBOL}
            )


        
            if response.status_code == 429:

                wait_time = 2 ** retry_count

                print(
                    f"Rate limit reached. "
                    f"Retrying after {wait_time} seconds..."
                )

                time.sleep(wait_time)

                retry_count += 1

                continue




            response.raise_for_status()


            data = response.json()

            return data



        except requests.exceptions.RequestException as e:

            print(
                "API Error:",
                e
            )

            wait_time = 2 ** retry_count

            time.sleep(wait_time)

            retry_count += 1



    print(
        "Maximum retries reached. "
        "Skipping this cycle."
    )

    return None




def analyze_data():

    print("\nFetching Binance Data...")


    data = fetch_binance_data()


    if data is not None:


        df = pd.DataFrame(
            [data]
        )


        print("\nMarket Data:")

        print(df)


        price = float(
            df["price"][0]
        )


        print(
            f"\nCurrent {SYMBOL} Price: ${price}"
        )


    else:

        print(
            "No data available."
        )



schedule.every(1).hour.do(
    analyze_data
)


print(
    "Binance monitoring started..."
)



while True:

    schedule.run_pending()

    time.sleep(1)