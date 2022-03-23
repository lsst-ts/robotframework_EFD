

def filter_measurements(measurements, csc_name, topic_name):
    """Filter full list of measurements looking for CSC plus topic name.
    Parameters
    ----------
    measurements : list[str]
        The list of all available measurements.
    csc_name : str
        Name of the CSC to filter on.
    topic_name : str
        Name of the topic to filter on.
    Returns
    -------
    list[str]
        Filtered list of topics.
    """
    csc_filtered = [measurement.split('.')[-1] for measurement in measurements
                    if csc_name in measurement]
    topic_filtered = [topic for topic in csc_filtered if topic_name in topic]
    return topic_filtered
