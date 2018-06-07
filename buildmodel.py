def build_model():
    # Create model input templates
    [array of input templates] = create_model_templates()
    # Construct training and inference logits from seq2seqmodel
    t_logits, i_logits = seq2seqmodel([array of input templates],
                                      [max_length and other parameters])
    # Construct tensors for the training logits and inference logits;
    # logits map tensors to the softmax function
    tf.summary(predictions(t_logits, i_logits))
    # Construct the weights using the weighted cross-entropy error function
    tf.summary(cost(weights))
    # merge Tensorflow summary of tensors, and weights
    tf.summary.merge_all()
    # return graph created by nodes like [prediction, cost...]