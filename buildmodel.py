def build_model():
    # Create model input templates
    [array of input templates] = create_model_templates()
    # Construct decoding logits from seq2seqmodel;
    # logits map tensors to the softmax probability function
    # tensors are simply n-dimensional lists
    logits = seq2seqmodel([array of input templates],
                                      [max_length and other parameters])
    # Construct tensors for the decoding logits
    tf.summary(predictions(logits))
    # Construct the weights using the weighted cross-entropy error function
    tf.summary(cost(weights))
    # merge Tensorflow summary of tensors, and weights
    tf.summary.merge_all()
    # return graph created by nodes like [prediction, cost...]
    return [*graph]