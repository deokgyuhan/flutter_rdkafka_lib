import 'dart:ffi';
import 'package:ffi/ffi.dart';

import 'types.dart';

/// see https://docs.confluent.io/platform/current/clients/librdkafka/html/index.html

typedef rd_kafka_version_native_t = Int32 Function();
final String rd_kafka_version_symbol = 'rd_kafka_version';

typedef rd_kafka_version_str_native_t = Pointer<Utf8> Function();
final String rd_kafka_version_str_symbol = 'rd_kafka_version_str';

/// [type] is index of [rd_kafka_type_t_e]
/// [conf] create with [rd_kafka_conf_new]
///
/// return nullable
typedef rd_kafka_new_native_t = Pointer<rd_kafka_t> Function(Int32 type, Pointer<rd_kafka_conf_t> conf, Pointer<Utf8> errstr, Pointer<Int32> errstr_size);
final String rd_kafka_new_symbol = 'rd_kafka_new';

typedef rd_kafka_conf_new_native_t = Pointer<rd_kafka_conf_t> Function();
final String rd_kafka_conf_new_symbol = 'rd_kafka_conf_new';

/// return index of [rd_kafka_conf_res_t_e]
typedef rd_kafka_conf_set_native_t = Int32 Function(Pointer<rd_kafka_conf_t> conf, Pointer<Utf8> name, Pointer<Utf8> value, Pointer<Utf8> errstr, Pointer<Int32> errstr_size);
final String rd_kafka_conf_set_symbol = 'rd_kafka_conf_set';

typedef rd_kafka_topic_new_native_t = Pointer<rd_kafka_topic_t> Function(Pointer<rd_kafka_t> rk, Pointer<Utf8> topic, Pointer<rd_kafka_topic_conf_t> conf);
final String rd_kafka_topic_new_symbol = 'rd_kafka_topic_new';

typedef rd_kafka_topic_conf_new_native_t = Pointer<rd_kafka_topic_conf_t> Function();
final String rd_kafka_topic_conf_new_symbol = 'rd_kafka_topic_conf_new';

/// return index of [rd_kafka_conf_res_t_e]
typedef rd_kafka_topic_conf_set_native_t = Int32 Function(Pointer<rd_kafka_topic_conf_t> conf, Pointer<Utf8> name, Pointer<Utf8> value, Pointer<Utf8> errstr, Pointer<Int32> errstr_size);
final String rd_kafka_topic_conf_set_symbol = 'rd_kafka_topic_conf_set';

/// [all_topics] if non-zero: request info about all topics in cluster, if zero: only request info about locally known topics.
/// [only_rkt] only request info about this topic
///
/// return index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_metadata_native_t = Int32 Function(Pointer<rd_kafka_t> rk, Int32 all_topics, Pointer<rd_kafka_topic_t> only_rkt, Pointer<Pointer<rd_kafka_metadata_t>> metadatap, Int32 timeout_ms);
final String rd_kafka_metadata_symbol = 'rd_kafka_metadata';

typedef rd_kafka_topic_destroy_native_t = Void Function(Pointer<rd_kafka_topic_t> rkt);
final String rd_kafka_topic_destroy_symbol = 'rd_kafka_topic_destroy';

typedef rd_kafka_topic_name_native_t = Pointer<Utf8> Function(Pointer<rd_kafka_topic_t> rkt);
final String rd_kafka_topic_name_symbol = 'rd_kafka_topic_name';

typedef rd_kafka_destroy_native_t = Void Function(Pointer<rd_kafka_t> rk);
final String rd_kafka_destroy_symbol = 'rd_kafka_destroy';

/// return index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_get_watermark_offsets_native_t = Int32 Function(Pointer<rd_kafka_t> rk, Pointer<Utf8> topic, Int32 partition, Pointer<Int64> low, Pointer<Int64> high);
final String rd_kafka_get_watermark_offsets_symbol = 'rd_kafka_get_watermark_offsets';

/// return index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_query_watermark_offsets_native_t = Int32 Function(Pointer<rd_kafka_t> rk, Pointer<Utf8> topic, Int32 partition, Pointer<Int64> low, Pointer<Int64> high, Int32 timeout_ms);
final String rd_kafka_query_watermark_offsets_symbol = 'rd_kafka_query_watermark_offsets';

/// [err] index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_err2str_native_t = Pointer<Utf8> Function(Int32 err);
final String rd_kafka_err2str_symbol = 'rd_kafka_err2str';

/// [err] index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_err2name_native_t = Pointer<Utf8> Function(Int32 err);
final String rd_kafka_err2name_symbol = 'rd_kafka_err2name';

/// [group] is an optional group name to describe, otherwise (NULL) all groups are returned.
typedef rd_kafka_list_groups_native_t = Int32 Function(Pointer<rd_kafka_t> rk, Pointer<Utf8> group, Pointer<Pointer<rd_kafka_group_list>> grplistp, Int32 timeout_ms);
final String rd_kafka_list_groups_symbol = 'rd_kafka_list_groups';

typedef rd_kafka_group_list_destroy_native_t = Void Function(Pointer<rd_kafka_group_list> grplist);
final String rd_kafka_group_list_destroy_symbol = 'rd_kafka_group_list_destroy';

typedef rd_kafka_topic_partition_list_new_native_t = Pointer<rd_kafka_topic_partition_list_t> Function(Int32 size);
final String rd_kafka_topic_partition_list_new_symbol = 'rd_kafka_topic_partition_list_new';

typedef rd_kafka_topic_partition_list_destroy_native_t = Void Function(Pointer<rd_kafka_topic_partition_list_t> rkparlist);
final String rd_kafka_topic_partition_list_destroy_symbol = 'rd_kafka_topic_partition_list_destroy';

typedef rd_kafka_topic_partition_list_add_native_t = Pointer<rd_kafka_topic_partition_t> Function(Pointer<rd_kafka_topic_partition_list_t> rkparlist, Pointer<Utf8> topic, Int32 partition);
final String rd_kafka_topic_partition_list_add_symbol = 'rd_kafka_topic_partition_list_add';

typedef rd_kafka_topic_partition_list_add_range_native_t = Void Function(Pointer<rd_kafka_topic_partition_list_t> rkparlist, Pointer<Utf8> topic, Int32 start, Int32 end);
final String rd_kafka_topic_partition_list_add_range_symbol = 'rd_kafka_topic_partition_list_add_range';

/// return 1 if partition was found (and removed), else 0.
typedef rd_kafka_topic_partition_list_del_native_t = Int32 Function(Pointer<rd_kafka_topic_partition_list_t> rkparlist, Pointer<Utf8> topic, Int32 partition);
final String rd_kafka_topic_partition_list_del_symbol = 'rd_kafka_topic_partition_list_del';

/// return index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_topic_partition_list_set_offset_native_t = Int32 Function(Pointer<rd_kafka_topic_partition_list_t> rkparlist, Pointer<Utf8> topic, Int32 partition, Int64 offset);
final String rd_kafka_topic_partition_list_set_offset_symbol = 'rd_kafka_topic_partition_list_set_offset';

/// return index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_committed_native_t = Int32 Function(Pointer<rd_kafka_t> rk, Pointer<rd_kafka_topic_partition_list_t> partitions, Int32 timeout_ms);
final String rd_kafka_committed_symbol = 'rd_kafka_committed';


//---------------------------- 2023.07.10(rdkafka_example.c)-----------------------------------------------------------
typedef rd_kafka_conf_set_log_cb_native_t =  Void Function(Pointer<rd_kafka_conf_t> conf, Pointer<NativeFunction<Void Function(Pointer<rd_kafka_t>, Int32, Pointer<Utf8>, Pointer<Utf8>)>> logCb);
final String rd_kafka_conf_set_log_cb_symbol = 'rd_kafka_conf_set_log_cb';

//return rd_kafka_headers_t*
typedef rd_kafka_headers_new_native_t =  Pointer<rd_kafka_headers_t> Function(Int32 initial_count);
final String rd_kafka_headers_new_symbol = 'rd_kafka_headers_new';

/// return index of [rd_kafka_resp_err_t]
typedef rd_kafka_header_add_native_t =  Int32 Function(Pointer<rd_kafka_headers_t> hdrs, Pointer<Utf8> name, Int64 name_size, Pointer<Void> value, Int64 value_size);
final String rd_kafka_header_add_symbol = 'rd_kafka_header_add';

// rd_kafka_conf_properties_show
typedef rd_kafka_conf_properties_show_native_t =  Void Function(Pointer<Void> fp);
final String rd_kafka_conf_properties_show_symbol = 'rd_kafka_conf_properties_show';

// rd_kafka_topic_conf_get
///// return index of [rd_kafka_resp_err_t]
typedef rd_kafka_topic_conf_get_native_t =  Int32 Function(Pointer<rd_kafka_topic_conf_t> conf, Pointer<Utf8> name, Pointer<Utf8> dest, Int32 dest_size);
final String rd_kafka_topic_conf_get_symbol = 'rd_kafka_topic_conf_get';

// rd_kafka_conf_get
///// return index of [rd_kafka_resp_err_t]
typedef rd_kafka_conf_get_native_t =  Int32 Function(Pointer<rd_kafka_conf_t> conf, Pointer<Utf8> name, Pointer<Utf8> dest, Int32 dest_size);
final String rd_kafka_conf_get_symbol = 'rd_kafka_conf_get';

// rd_kafka_conf_dump
typedef rd_kafka_conf_dump_native_t =  Pointer<Pointer<Utf8>> Function(Pointer<rd_kafka_conf_t> conf, Pointer<Int32> cntp);
final String rd_kafka_conf_dump_symbol = 'rd_kafka_conf_dump';

// rd_kafka_topic_conf_dump
typedef rd_kafka_topic_conf_dump_native_t =  Pointer<Pointer<Utf8>> Function(Pointer<rd_kafka_topic_conf_t> conf, Pointer<Int32> cntp);
final String rd_kafka_topic_conf_dump_symbol = 'rd_kafka_topic_conf_dump';

// rd_kafka_conf_dump_free
typedef rd_kafka_conf_dump_free_native_t =  Void Function(Pointer<Pointer<Utf8>> attr, Int32 cnt);
final String rd_kafka_conf_dump_free_symbol = 'rd_kafka_conf_dump_free';

// rd_kafka_conf_set_dr_msg_cb
typedef rd_kafka_conf_set_dr_msg_cb_native_t =  Void Function(Pointer<rd_kafka_conf_t> conf, Pointer<NativeFunction<Void Function(Pointer<rd_kafka_t>, Pointer<rd_kafka_message_t>, Pointer<Void>)>> dr_msg_cb);
final String rd_kafka_conf_set_dr_msg_cb_symbol = 'rd_kafka_conf_set_dr_msg_cb';

// rd_kafka_headers_copy
typedef rd_kafka_headers_copy_native_t =  Pointer<rd_kafka_headers_t> Function(Pointer<rd_kafka_headers_t> src);
final String rd_kafka_headers_copy_symbol = 'rd_kafka_headers_copy';

//------> 현재 작업중
// rd_kafka_produce
typedef rd_kafka_produce_native_t =  Int32 Function(Pointer<rd_kafka_topic_t> rkt, Int32 partition, Int msgflags, Pointer<Void> payload, Int32 len, Pointer<Void> key, Int32 keylen, Pointer<Void> msg_opaque);
final String rd_kafka_produce_symbol = 'rd_kafka_produce';

// rd_kafka_last_error
/// return index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_last_error_native_t =  Int32 Function();
final String rd_kafka_last_error_symbol = 'rd_kafka_last_error';

// rd_kafka_poll
typedef rd_kafka_poll_native_t =  Int Function(Pointer<rd_kafka_t> rk, Int timeout_ms);
final String rd_kafka_poll_symbol = 'rd_kafka_poll';

// rd_kafka_outq_len
typedef rd_kafka_outq_len_native_t =  Int Function(Pointer<rd_kafka_t> rk);
final String rd_kafka_outq_len_symbol = 'rd_kafka_outq_len';

// rd_kafka_consume_start
typedef rd_kafka_consume_start_native_t =  Int Function(Pointer<rd_kafka_topic_t> rkt, Int32 partition, Int64 offset);
final String rd_kafka_consume_start_symbol = 'rd_kafka_consume_start';

// rd_kafka_consume
typedef rd_kafka_consume_native_t =  Pointer<rd_kafka_message_t> Function(Pointer<rd_kafka_topic_t> rkt, Int32 partition, Int timeout_ms);
final String rd_kafka_consume_symbol = 'rd_kafka_consume';

// rd_kafka_message_destroy
typedef rd_kafka_message_destroy_native_t =  Void Function(Pointer<rd_kafka_message_t> rkmessage);
final String rd_kafka_message_destroy_symbol = 'rd_kafka_message_destroy';

// rd_kafka_seek
/// return index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_seek_native_t =  Int32 Function(Pointer<rd_kafka_topic_t> rkt, Int32 partition, Int64 offset, Int timeout_ms);
final String rd_kafka_seek_symbol = 'rd_kafka_seek';

// rd_kafka_consume_stop
typedef rd_kafka_consume_stop_native_t =  Int Function(Pointer<rd_kafka_topic_t> rkt, Int32 partition);
final String rd_kafka_consume_stop_symbol = 'rd_kafka_consume_stop';

// rd_kafka_topic_conf_destroy
typedef rd_kafka_topic_conf_destroy_native_t =  Void Function(Pointer<rd_kafka_topic_conf_t> topic_conf);
final String rd_kafka_topic_conf_destroy_symbol = 'rd_kafka_topic_conf_destroy';

// rd_kafka_headers_destroy
typedef rd_kafka_headers_destroy_native_t =  Void Function(Pointer<rd_kafka_headers_t> hdrs);
final String rd_kafka_headers_destroy_symbol = 'rd_kafka_headers_destroy';

// rd_kafka_wait_destroyed
typedef rd_kafka_wait_destroyed_native_t =  Int Function(Int timeout_ms);
final String rd_kafka_wait_destroyed_symbol = 'rd_kafka_wait_destroyed';

//-> consumer.c
// rd_kafka_poll_set_consumer
/// return index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_poll_set_consumer_native_t =  Int32 Function(Pointer<rd_kafka_t> rk);
final String rd_kafka_poll_set_consumer_symbol = 'rd_kafka_poll_set_consumer';

// rd_kafka_subscribe
/// return index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_subscribe_native_t =  Int32 Function(Pointer<rd_kafka_t> rk, Pointer<rd_kafka_topic_partition_list_t> topics);
final String rd_kafka_subscribe_symbol = 'rd_kafka_subscribe';

// rd_kafka_consumer_poll
typedef rd_kafka_consumer_poll_native_t =  Pointer<rd_kafka_message_t> Function(Pointer<rd_kafka_t> rk, Int timeout_ms);
final String rd_kafka_consumer_poll_symbol = 'rd_kafka_consumer_poll';

// rd_kafka_message_errstr
typedef rd_kafka_message_errstr_native_t =  Pointer<Utf8> Function(Pointer<rd_kafka_message_t> rkmessage);
final String rd_kafka_message_errstr_symbol = 'rd_kafka_message_errstr';

// rd_kafka_message_leader_epoch
typedef rd_kafka_message_leader_epoch_native_t =  Int32 Function(Pointer<rd_kafka_message_t> rkmessage);
final String rd_kafka_message_leader_epoch_symbol = 'rd_kafka_message_leader_epoch';

// rd_kafka_consumer_close
/// return index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_consumer_close_native_t =  Int32 Function(Pointer<rd_kafka_t> rk);
final String rd_kafka_consumer_close_symbol = 'rd_kafka_consumer_close';

//-> rdkafka_complex_consumer_example.c
// rd_kafka_name
typedef rd_kafka_name_native_t =  Pointer<Utf8> Function(Pointer<rd_kafka_t> rk);
final String rd_kafka_name_symbol = 'rd_kafka_name';

// rd_kafka_rebalance_protocol
typedef rd_kafka_rebalance_protocol_native_t =  Pointer<Utf8> Function(Pointer<rd_kafka_t> rk);
final String rd_kafka_rebalance_protocol_symbol = 'rd_kafka_rebalance_protocol';

// rd_kafka_incremental_assign
//
typedef rd_kafka_incremental_assign_native_t =  Pointer<rd_kafka_error_t> Function(Pointer<rd_kafka_t> rk, Pointer<rd_kafka_topic_partition_list_t> partitions);
final String rd_kafka_incremental_assign_symbol = 'rd_kafka_incremental_assign';

// rd_kafka_assign
//// return index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_assign_native_t =  Int32 Function(Pointer<rd_kafka_t> rk, Pointer<rd_kafka_topic_partition_list_t> partitions);
final String rd_kafka_assign_symbol = 'rd_kafka_assign';

// rd_kafka_incremental_unassign
typedef rd_kafka_incremental_unassign_native_t =  Pointer<rd_kafka_error_t> Function(Pointer<rd_kafka_t> rk, Pointer<rd_kafka_topic_partition_list_t> partitions);
final String rd_kafka_incremental_unassign_symbol = 'rd_kafka_incremental_unassign';

// rd_kafka_error_string
typedef rd_kafka_error_string_native_t =  Pointer<Utf8> Function(Pointer<rd_kafka_error_t> error);
final String rd_kafka_error_string_symbol = 'rd_kafka_error_string';

// rd_kafka_error_destroy
typedef rd_kafka_error_destroy_native_t =  Void Function(Pointer<rd_kafka_error_t> error);
final String rd_kafka_error_destroy_symbol = 'rd_kafka_error_destroy';

// rd_kafka_conf_get_default_topic_conf
typedef rd_kafka_conf_get_default_topic_conf_native_t =  Pointer<rd_kafka_topic_conf_t> Function(Pointer<rd_kafka_conf_t> conf);
final String rd_kafka_conf_get_default_topic_conf_symbol = 'rd_kafka_conf_get_default_topic_conf';

//-> producer.c
// rd_kafka_producev
//// return index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_producev_native_t =  Int32 Function(Pointer<rd_kafka_t> rk);
final String rd_kafka_producev_symbol = 'rd_kafka_producev';

// rd_kafka_flush
//// return index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_flush_native_t =  Int32 Function(Pointer<rd_kafka_t> rk, Int timeout_ms);
const String rd_kafka_flush_symbol = 'rd_kafka_flush';

// rd_kafka_fatal_error
//// return index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_fatal_error_native_t =  Int32 Function(Pointer<rd_kafka_t> rk, Pointer<Utf8> errstr, Int32 errstr_size);
final String rd_kafka_fatal_error_symbol = 'rd_kafka_fatal_error';

// rd_kafka_conf_set_error_cb
typedef rd_kafka_conf_set_error_cb_native_t =  Void Function(Pointer<rd_kafka_conf_t> conf, Pointer<NativeFunction<Void Function(Pointer<rd_kafka_t>, Int, Pointer<Utf8>, Pointer<Void>)>> error_cb);
final String rd_kafka_conf_set_error_cb_symbol = 'rd_kafka_conf_set_error_cb';

// rd_kafka_test_fatal_error
//// return index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_test_fatal_error_native_t =  Int32 Function(Pointer<rd_kafka_t> rk, Int32 err, Pointer<Utf8> reason);
final String rd_kafka_test_fatal_error_symbol = 'rd_kafka_test_fatal_error';

//-> delete_record.c
// rd_kafka_queue_new
typedef rd_kafka_queue_new_native_t =  Pointer<rd_kafka_queue_t> Function(Pointer<rd_kafka_t> rk);
final String rd_kafka_queue_new_symbol = 'rd_kafka_queue_new';

// rd_kafka_AdminOptions_new
// rd_kafka_admin_op_t_e -> for_api
typedef rd_kafka_AdminOptions_new_native_t =  Pointer<rd_kafka_AdminOptions_t> Function(Pointer<rd_kafka_t> rk, Int32 for_api);
final String rd_kafka_AdminOptions_new_symbol = 'rd_kafka_AdminOptions_new';

// rd_kafka_AdminOptions_set_request_timeout
//// return index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_AdminOptions_set_request_timeout_native_t =  Int32 Function(Pointer<rd_kafka_AdminOptions_t> options, Int timeout_ms, Pointer<Utf8> errstr, Int32 errstr_size);
final String rd_kafka_AdminOptions_set_request_timeout_symbol = 'rd_kafka_AdminOptions_set_request_timeout';

// rd_kafka_DeleteRecords_new
typedef rd_kafka_DeleteRecords_new_native_t =  Pointer<rd_kafka_DeleteRecords_t> Function(Pointer<rd_kafka_topic_partition_list_t> before_offsets);
final String rd_kafka_DeleteRecords_new_symbol = 'rd_kafka_DeleteRecords_new';

// rd_kafka_DeleteRecords
typedef rd_kafka_DeleteRecords_native_t =  Void Function(Pointer<rd_kafka_t> rk, Pointer<Pointer<rd_kafka_DeleteRecords_t>> del_records, Int32 del_record_cnt, Pointer<rd_kafka_AdminOptions_t> options, 	Pointer<rd_kafka_queue_t> rkqu);
final String rd_kafka_DeleteRecords_symbol = 'rd_kafka_DeleteRecords';

// rd_kafka_DeleteRecords_destroy
typedef rd_kafka_DeleteRecords_destroy_native_t =  Void Function(Pointer<rd_kafka_DeleteRecords_t> del_records);
final String rd_kafka_DeleteRecords_destroy_symbol = 'rd_kafka_DeleteRecords_destroy';

// rd_kafka_AdminOptions_destroy
typedef rd_kafka_AdminOptions_destroy_native_t =  Void Function(Pointer<rd_kafka_AdminOptions_t> options);
final String rd_kafka_AdminOptions_destroy_symbol = 'rd_kafka_AdminOptions_destroy';

// rd_kafka_queue_poll
typedef rd_kafka_queue_poll_native_t =  Pointer<rd_kafka_event_t> Function(Pointer<rd_kafka_queue_t> rkqu, Int timeout_ms);
final String rd_kafka_queue_poll_symbol = 'rd_kafka_queue_poll';

// rd_kafka_event_error
//// return index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_event_error_native_t =  Int32 Function(Pointer<rd_kafka_event_t> rkev);
final String rd_kafka_event_error_symbol = 'rd_kafka_event_error';

// rd_kafka_event_error_string
typedef rd_kafka_event_error_string_native_t =  Pointer<Utf8> Function(Pointer<rd_kafka_event_t> rkev);
final String rd_kafka_event_error_string_symbol = 'rd_kafka_event_error_string';

// rd_kafka_event_DeleteRecords_result
typedef rd_kafka_event_DeleteRecords_result_native_t =  Pointer<rd_kafka_DeleteRecords_result_t> Function(Pointer<rd_kafka_event_t> rkev);
final String rd_kafka_event_DeleteRecords_result_symbol = 'rd_kafka_event_DeleteRecords_result';

// rd_kafka_DeleteRecords_result_offsets
typedef rd_kafka_DeleteRecords_result_offsets_native_t =  Pointer<rd_kafka_topic_partition_list_t> Function(Pointer< rd_kafka_DeleteRecords_result_t> result);
final String rd_kafka_DeleteRecords_result_offsets_symbol = 'rd_kafka_DeleteRecords_result_offsets';

// rd_kafka_event_destroy
typedef rd_kafka_event_destroy_native_t =  Void Function(Pointer<rd_kafka_event_t> rkev);
final String rd_kafka_event_destroy_symbol = 'rd_kafka_event_destroy';

// rd_kafka_queue_destroy
typedef rd_kafka_queue_destroy_native_t =  Void Function(Pointer<rd_kafka_queue_t> rkqu);
final String rd_kafka_queue_destroy_symbol = 'rd_kafka_queue_destroy';

//-> rdkafka_performance.c
// rd_kafka_message_broker_id
typedef rd_kafka_message_broker_id_native_t =  Int32 Function(Pointer<rd_kafka_message_t> rkmessage);
final String rd_kafka_message_broker_id_symbol = 'rd_kafka_message_broker_id';

// rd_kafka_message_headers
//// return index of [rd_kafka_resp_err_t_e]
typedef rd_kafka_message_headers_native_t =  Int32 Function(Pointer<rd_kafka_message_t> rkmessage, Pointer<Pointer<rd_kafka_headers_t>> hdrsp);
final String rd_kafka_message_headers_symbol = 'rd_kafka_message_headers';

// rd_kafka_conf_set_throttle_cb
typedef rd_kafka_conf_set_throttle_cb_native_t =  Void Function(Pointer<rd_kafka_conf_t> conf, Pointer<NativeFunction<Void Function(Pointer<rd_kafka_t>, Pointer<Utf8>, Int32, Int, Pointer<Void>)>> throttle_cb);
final String rd_kafka_conf_set_throttle_cb_symbol = 'rd_kafka_conf_set_throttle_cb';

// rd_kafka_conf_set_offset_commit_cb
typedef rd_kafka_conf_set_offset_commit_cb_native_t =  Void Function(Pointer<rd_kafka_conf_t> conf, Pointer<NativeFunction<Void Function(Pointer<rd_kafka_t>, Int32, Pointer< rd_kafka_topic_partition_list_t>, Pointer<Void>)>> offset_commit_cb);
final String rd_kafka_conf_set_offset_commit_cb_symbol = 'rd_kafka_conf_set_offset_commit_cb';

// rd_kafka_conf_set_stats_cb
typedef rd_kafka_conf_set_stats_cb_native_t =  Void Function(Pointer<rd_kafka_conf_t> conf, Pointer<NativeFunction<Int Function(Pointer<rd_kafka_t>, Pointer<Utf8>, Int32, Pointer<Void>)>> stats_cb);
final String rd_kafka_conf_set_stats_cb_symbol = 'rd_kafka_conf_set_stats_cb';

// rd_kafka_consume_start_queue
typedef rd_kafka_consume_start_queue_native_t =  Int Function(Pointer<rd_kafka_topic_t> rkt, Int32 partition, Int64 offset, Pointer<rd_kafka_queue_t> rkqu);
final String rd_kafka_consume_start_queue_symbol = 'rd_kafka_consume_start_queue';

// rd_kafka_consume_callback_queue
typedef rd_kafka_consume_callback_queue_native_t =  Int Function(Pointer<rd_kafka_queue_t> rkqu, Int timeout_ms, Pointer<NativeFunction<Void Function(Pointer<rd_kafka_message_t>, Pointer<Void>)>> consume_cb, Pointer<Void> commit_opaque);
final String rd_kafka_consume_callback_queue_symbol = 'rd_kafka_consume_callback_queue';

// rd_kafka_conf_set_rebalance_cb
typedef rd_kafka_conf_set_rebalance_cb_native_t =  Void Function(Pointer<rd_kafka_conf_t> conf, Pointer<NativeFunction<Void Function(Pointer<rd_kafka_t>, Int32, Pointer< rd_kafka_topic_partition_list_t>, Pointer<Void>)>> rebalance_cb);
final String rd_kafka_conf_set_rebalance_cb_symbol = 'rd_kafka_conf_set_rebalance_cb';

// rd_kafka_queue_get_consumer
typedef rd_kafka_queue_get_consumer_native_t =  Pointer<rd_kafka_queue_t> Function(Pointer<rd_kafka_t> rk);
final String rd_kafka_queue_get_consumer_symbol = 'rd_kafka_queue_get_consumer';

// rd_kafka_consume_batch_queue
typedef rd_kafka_consume_batch_queue_native_t =  Int64 Function(Pointer<rd_kafka_queue_t> rkqu, Int timeout_ms, Pointer<Pointer<rd_kafka_message_t>> rkmessages, Int32 rkmessages_size);
final String rd_kafka_consume_batch_queue_symbol = 'rd_kafka_consume_batch_queue';

//-> describe_consumer_group.c
