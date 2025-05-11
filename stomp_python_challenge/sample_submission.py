def stomp(
    ref_data,
    query_data,
    window_size,
    exclusion_zone=0.5,
    verbose=2,
):
    """
    Compute the Matrix Profile and Profile Index for univariate time series using 
    the STOMP algorithm.

    This function supports both self-join (when `query_data` is None) and join similarity (when 
    `query_data` is provided). For self-join, it also computes the left and right matrix profiles.

    Parameters
    ----------
    ref_data: numpy.ndarray
        A univariate time series of shape (n_samples,).

    query_data: numpy.ndarray or None
        Optional second univariate time series of shape (n_samples,). If provided, a join 
        matrix profile is computed between `ref_data` and `query_data`. If None, a self-join 
        is performed on `ref_data`.

    window_size: int
        Size of the sliding window.
    
    exclusion_zone: float, optional
        Size of the exclusion zone based on window size to avoid trivial matches during self-join. 
        Default is 0.5. Ignored when `query_data` is provided.

    verbose: int, optional
        Controls verbosity of output:
        - `0`: No output
        - `1`: Text output
        - `2`: Text output with progress bar (default)

    Returns
    -------
    mp: numpy.ndarray
        The matrix profile of shape (n_samples - window_size + 1,).

    pi: numpy.ndarray
        The profile index corresponding to `mp`, same shape.
    
    rmp: numpy.ndarray or None
        Right matrix profile (used only in self-join). Same shape as `mp`. 
        Returns None if `query_data` is provided (join similarity).
    
    rpi: numpy.ndarray or None
        Right profile index. Same shape as `pi`.
        Returns None if `query_data` is provided (join similarity).

    lmp: numpy.ndarray or None
        Left matrix profile (used only in self-join). Same shape as `mp`. 
        Returns None if `query_data` is provided (join similarity).
    
    lpi: numpy.ndarray or None
        Left profile index. Same shape as `pi`.
        Returns None if `query_data` is provided (join similarity).
    """
    return None, None, None, None, None, None