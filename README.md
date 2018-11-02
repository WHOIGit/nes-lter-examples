# Examples of using online data produced by the NES-LTER information management system (IMS)

This repository contains example data from NES-LTER along with executable code for downloading and visualizing the data in Python (Jupyter), R, and MATLAB.

The NES-LTER IMS is under development and its current capabilities include parsing raw data and producing cleaned-up CSV data that can be read by any programming language. Raw data includes both instrument data such as CTD bottle summary files, as well as PI-provided spreadsheets. The "data cleaning" is the first part of the proposed data pipeline that would support queries and discovery, access to data, and export to external repositories, all through RESTful web APIs that can pull the data directly into your favorite tools. The idea is to reduce the data handling burden on PIs and create a streamlined, automated process for accessing and using NES-LTER data.

In the examples, data is read from GitHub and visualized in various useful ways. In our eventual data pipeline we will provide web APIs and will not be serving data from GitHub, but the code examples here would only have to be slightly modified (changing the access URL) to work with the data pipeline.
