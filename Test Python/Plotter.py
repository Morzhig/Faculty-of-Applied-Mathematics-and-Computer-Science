import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

class Plotter:
    def clear_folder(self, directory_path):
            with os.scandir(directory_path) as entries:
                for entry in entries:
                    if entry.is_file():
                        os.unlink(entry.path)

    def columns_plots(self, df):
        
        os.makedirs('Plots', exist_ok=True)

        self.clear_folder('Plots')

        for column in df.columns:
            plt.figure(figsize=(12, 6))
            plt.plot(df[column])
            plt.title(f'График для стобца {column}')
            plt.xlabel('Room Index')
            plt.ylabel(column)

            plt.savefig(f"Plots/{column}")

            plt.show()
            
            print(f"Plots/{column}")
        
url = 'https://ai-process-sandy.s3.eu-west-1.amazonaws.com/purge/deviation.json'

df = pd.read_json(url)

plots = Plotter()

plots.plots(df)