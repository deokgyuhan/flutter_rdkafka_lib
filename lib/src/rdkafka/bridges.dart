import 'dart:ffi';
import 'package:ffi/ffi.dart';

import '../loader.dart';
import 'signatures.dart';
import 'types.dart';

class RdkafkaBridges {

  final DynamicLibrary _lib;

  RdkafkaBridges(this._lib);

  factory RdkafkaBridges.defaultLib() => RdkafkaBridges(Loader.load());

  static RdkafkaBridges get instance => _getInstance();
  static RdkafkaBridges? _instance;
  static RdkafkaBridges _getInstance() => _instance ??= RdkafkaBridges.defaultLib();

  // bind method

  late final int Function() rd_kafka_version = _lib.lookup<NativeFunction<rd_kafka_version_native_t>>(rd_kafka_version_symbol).asFunction();

  late final rd_kafka_version_str_native_t rd_kafka_version_str = _lib.lookup<NativeFunction<rd_kafka_version_str_native_t>>(rd_kafka_version_str_symbol).asFunction();

  late final Pointer<rd_kafka_t> Function(int type, Pointer<rd_kafka_conf_t> conf, Pointer<Utf8> errstr, Pointer<Int32> errstr_size) rd_kafka_new = _lib.lookup<NativeFunction<rd_kafka_new_native_t>>(rd_kafka_new_symbol).asFunction();

  late final rd_kafka_conf_new_native_t rd_kafka_conf_new = _lib.lookup<NativeFunction<rd_kafka_conf_new_native_t>>(rd_kafka_conf_new_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_conf_t> conf, Pointer<Utf8> name, Pointer<Utf8> value, Pointer<Utf8> errstr, Pointer<Int32> errstr_size) rd_kafka_conf_set = _lib.lookup<NativeFunction<rd_kafka_conf_set_native_t>>(rd_kafka_conf_set_symbol).asFunction();

  late final rd_kafka_topic_new_native_t rd_kafka_topic_new = _lib.lookup<NativeFunction<rd_kafka_topic_new_native_t>>(rd_kafka_topic_new_symbol).asFunction();

  late final rd_kafka_topic_conf_new_native_t rd_kafka_topic_conf_new = _lib.lookup<NativeFunction<rd_kafka_topic_conf_new_native_t>>(rd_kafka_topic_conf_new_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_topic_conf_t> conf, Pointer<Utf8> name, Pointer<Utf8> value, Pointer<Utf8> errstr, Pointer<Int32> errstr_size) rd_kafka_topic_conf_set = _lib.lookup<NativeFunction<rd_kafka_topic_conf_set_native_t>>(rd_kafka_topic_conf_set_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_t> rk, int all_topics, Pointer<rd_kafka_topic_t> only_rkt, Pointer<Pointer<rd_kafka_metadata_t>> metadatap, int timeout_ms) rd_kafka_metadata = _lib.lookup<NativeFunction<rd_kafka_metadata_native_t>>(rd_kafka_metadata_symbol).asFunction();

  late final void Function(Pointer<rd_kafka_topic_t> rkt) rd_kafka_topic_destroy = _lib.lookup<NativeFunction<rd_kafka_topic_destroy_native_t>>(rd_kafka_topic_destroy_symbol).asFunction();

  late final rd_kafka_topic_name_native_t rd_kafka_topic_name = _lib.lookup<NativeFunction<rd_kafka_topic_name_native_t>>(rd_kafka_topic_name_symbol).asFunction();

  late final void Function(Pointer<rd_kafka_t> rk) rd_kafka_destroy = _lib.lookup<NativeFunction<rd_kafka_destroy_native_t>>(rd_kafka_destroy_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_t> rk, Pointer<Utf8> topic, int partition, Pointer<Int64> low, Pointer<Int64> high) rd_kafka_get_watermark_offsets = _lib.lookup<NativeFunction<rd_kafka_get_watermark_offsets_native_t>>(rd_kafka_get_watermark_offsets_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_t> rk, Pointer<Utf8> topic, int partition, Pointer<Int64> low, Pointer<Int64> high, int timeout_ms) rd_kafka_query_watermark_offsets = _lib.lookup<NativeFunction<rd_kafka_query_watermark_offsets_native_t>>(rd_kafka_query_watermark_offsets_symbol).asFunction();

  late final Pointer<Utf8> Function(int err) rd_kafka_err2str = _lib.lookup<NativeFunction<rd_kafka_err2str_native_t>>(rd_kafka_err2str_symbol).asFunction();

  late final Pointer<Utf8> Function(int err) rd_kafka_err2name = _lib.lookup<NativeFunction<rd_kafka_err2name_native_t>>(rd_kafka_err2name_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_t> rk, Pointer<Utf8> group, Pointer<Pointer<rd_kafka_group_list>> grplistp, int timeout_ms) rd_kafka_list_groups = _lib.lookup<NativeFunction<rd_kafka_list_groups_native_t>>(rd_kafka_list_groups_symbol).asFunction();

  late final void Function(Pointer<rd_kafka_group_list>) rd_kafka_group_list_destroy = _lib.lookup<NativeFunction<rd_kafka_group_list_destroy_native_t>>(rd_kafka_group_list_destroy_symbol).asFunction();

  late final Pointer<rd_kafka_topic_partition_list_t> Function(int size) rd_kafka_topic_partition_list_new = _lib.lookup<NativeFunction<rd_kafka_topic_partition_list_new_native_t>>(rd_kafka_topic_partition_list_new_symbol).asFunction();

  late final void Function(Pointer<rd_kafka_topic_partition_list_t> rkparlist) rd_kafka_topic_partition_list_destroy = _lib.lookup<NativeFunction<rd_kafka_topic_partition_list_destroy_native_t>>(rd_kafka_topic_partition_list_destroy_symbol).asFunction();

  late final Pointer<rd_kafka_topic_partition_t> Function(Pointer<rd_kafka_topic_partition_list_t> rkparlist, Pointer<Utf8> topic, int partition) rd_kafka_topic_partition_list_add = _lib.lookup<NativeFunction<rd_kafka_topic_partition_list_add_native_t>>(rd_kafka_topic_partition_list_add_symbol).asFunction();

  late final void Function(Pointer<rd_kafka_topic_partition_list_t> rkparlist, Pointer<Utf8> topic, int start, int end) rd_kafka_topic_partition_list_add_range = _lib.lookup<NativeFunction<rd_kafka_topic_partition_list_add_range_native_t>>(rd_kafka_topic_partition_list_add_range_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_topic_partition_list_t> rkparlist, Pointer<Utf8> topic, int partition) rd_kafka_topic_partition_list_del = _lib.lookup<NativeFunction<rd_kafka_topic_partition_list_del_native_t>>(rd_kafka_topic_partition_list_del_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_topic_partition_list_t> rkparlist, Pointer<Utf8> topic, int partition, int offset) rd_kafka_topic_partition_list_set_offset = _lib.lookup<NativeFunction<rd_kafka_topic_partition_list_set_offset_native_t>>(rd_kafka_topic_partition_list_set_offset_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_t> rk, Pointer<rd_kafka_topic_partition_list_t> partitions, int timeout_ms) rd_kafka_committed = _lib.lookup<NativeFunction<rd_kafka_committed_native_t>>(rd_kafka_committed_symbol).asFunction();

  // 내가 작업한 부분 ---------------------------------------------------------------------------->
  late final void Function(Pointer<rd_kafka_conf_t> conf, Pointer<NativeFunction<Void Function(Pointer<rd_kafka_t>, Int32, Pointer<Utf8>, Pointer<Utf8>)>> logCb) rd_kafka_conf_set_log_cb = _lib.lookup<NativeFunction<rd_kafka_conf_set_log_cb_native_t>>(rd_kafka_conf_set_log_cb_symbol).asFunction();

  late final Pointer<rd_kafka_headers_t> Function(int initial_count) rd_kafka_headers_new = _lib.lookup<NativeFunction<rd_kafka_headers_new_native_t>>(rd_kafka_headers_new_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_headers_t> hdrs, Pointer<Utf8> name, int name_size, Pointer<Void> value, int value_size) rd_kafka_header_add = _lib.lookup<NativeFunction<rd_kafka_header_add_native_t>>(rd_kafka_header_add_symbol).asFunction();

  late final void Function(Pointer<Void> fp) rd_kafka_conf_properties_show = _lib.lookup<NativeFunction<rd_kafka_conf_properties_show_native_t>>(rd_kafka_conf_properties_show_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_topic_conf_t> conf, Pointer<Utf8> name, Pointer<Utf8> dest, int dest_size) rd_kafka_topic_conf_get = _lib.lookup<NativeFunction<rd_kafka_topic_conf_get_native_t>>(rd_kafka_topic_conf_get_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_conf_t> conf, Pointer<Utf8> name, Pointer<Utf8> dest, int dest_size) rd_kafka_conf_get = _lib.lookup<NativeFunction<rd_kafka_conf_get_native_t>>(rd_kafka_conf_get_symbol).asFunction();

  late final Pointer<Pointer<Utf8>> Function(Pointer<rd_kafka_conf_t> conf, Pointer<Int32> cntp) rd_kafka_conf_dump = _lib.lookup<NativeFunction<rd_kafka_conf_dump_native_t>>(rd_kafka_conf_dump_symbol).asFunction();

  late final Pointer<Pointer<Utf8>> Function(Pointer<rd_kafka_topic_conf_t> conf, Pointer<Int32> cntp) rd_kafka_topic_conf_dump = _lib.lookup<NativeFunction<rd_kafka_topic_conf_dump_native_t>>(rd_kafka_topic_conf_dump_symbol).asFunction();

  late final void Function(Pointer<Pointer<Utf8>> attr, int cnt) rd_kafka_conf_dump_free = _lib.lookup<NativeFunction<rd_kafka_conf_dump_free_native_t>>(rd_kafka_conf_dump_free_symbol).asFunction();

  late final void Function(Pointer<rd_kafka_conf_t> conf, Pointer<NativeFunction<Void Function(Pointer<rd_kafka_t>, Pointer<rd_kafka_message_t>, Pointer<Void>)>> dr_msg_cb) rd_kafka_conf_set_dr_msg_cb = _lib.lookup<NativeFunction<rd_kafka_conf_set_dr_msg_cb_native_t>>(rd_kafka_conf_set_dr_msg_cb_symbol).asFunction();

  late final Pointer<rd_kafka_headers_t> Function(Pointer<rd_kafka_headers_t> src) rd_kafka_headers_copy = _lib.lookup<NativeFunction<rd_kafka_headers_copy_native_t>>(rd_kafka_headers_copy_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_topic_t> rkt, int partition, int msgflags, Pointer<Void> payload, int len, Pointer<Void> key, int keylen, Pointer<Void> msg_opaque) rd_kafka_produce = _lib.lookup<NativeFunction<rd_kafka_produce_native_t>>(rd_kafka_produce_symbol).asFunction();

  late final int Function() rd_kafka_last_error = _lib.lookup<NativeFunction<rd_kafka_last_error_native_t>>(rd_kafka_last_error_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_t> rk, int timeout_ms) rd_kafka_poll = _lib.lookup<NativeFunction<rd_kafka_poll_native_t>>(rd_kafka_poll_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_t> rk) rd_kafka_outq_len = _lib.lookup<NativeFunction<rd_kafka_outq_len_native_t>>(rd_kafka_outq_len_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_topic_t> rkt, int partition, int offset) rd_kafka_consume_start = _lib.lookup<NativeFunction<rd_kafka_consume_start_native_t>>(rd_kafka_consume_start_symbol).asFunction();

  late final Pointer<rd_kafka_message_t> Function(Pointer<rd_kafka_topic_t> rkt, int partition, int timeout_ms) rd_kafka_consume = _lib.lookup<NativeFunction<rd_kafka_consume_native_t>>(rd_kafka_consume_symbol).asFunction();

  late final void Function(Pointer<rd_kafka_message_t> rkmessage) rd_kafka_message_destroy = _lib.lookup<NativeFunction<rd_kafka_message_destroy_native_t>>(rd_kafka_message_destroy_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_topic_t> rkt, int partition, int offset, int timeout_ms) rd_kafka_seek = _lib.lookup<NativeFunction<rd_kafka_seek_native_t>>(rd_kafka_seek_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_topic_t> rkt, int partition) rd_kafka_consume_stop = _lib.lookup<NativeFunction<rd_kafka_consume_stop_native_t>>(rd_kafka_consume_stop_symbol).asFunction();

  late final void Function(Pointer<rd_kafka_topic_conf_t> topic_conf) rd_kafka_topic_conf_destroy = _lib.lookup<NativeFunction<rd_kafka_topic_conf_destroy_native_t>>(rd_kafka_topic_conf_destroy_symbol).asFunction();

  late final void Function(Pointer<rd_kafka_headers_t> hdrs) rd_kafka_headers_destroy = _lib.lookup<NativeFunction<rd_kafka_headers_destroy_native_t>>(rd_kafka_headers_destroy_symbol).asFunction();

  late final int Function(int timeout_ms) rd_kafka_wait_destroyed = _lib.lookup<NativeFunction<rd_kafka_wait_destroyed_native_t>>(rd_kafka_wait_destroyed_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_t> rk) rd_kafka_poll_set_consumer = _lib.lookup<NativeFunction<rd_kafka_poll_set_consumer_native_t>>(rd_kafka_poll_set_consumer_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_t> rk, Pointer<rd_kafka_topic_partition_list_t> topics) rd_kafka_subscribe = _lib.lookup<NativeFunction<rd_kafka_subscribe_native_t>>(rd_kafka_subscribe_symbol).asFunction();

  late final Pointer<rd_kafka_message_t> Function(Pointer<rd_kafka_t> rk, int timeout_ms) rd_kafka_consumer_poll = _lib.lookup<NativeFunction<rd_kafka_consumer_poll_native_t>>(rd_kafka_consumer_poll_symbol).asFunction();

  late final Pointer<Utf8> Function(Pointer<rd_kafka_message_t> rkmessage) rd_kafka_message_errstr = _lib.lookup<NativeFunction<rd_kafka_message_errstr_native_t>>(rd_kafka_message_errstr_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_message_t> rkmessage) rd_kafka_message_leader_epoch = _lib.lookup<NativeFunction<rd_kafka_message_leader_epoch_native_t>>(rd_kafka_message_leader_epoch_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_t> rk) rd_kafka_consumer_close = _lib.lookup<NativeFunction<rd_kafka_consumer_close_native_t>>(rd_kafka_consumer_close_symbol).asFunction();

  late final Pointer<Utf8> Function(Pointer<rd_kafka_t> rk) rd_kafka_name = _lib.lookup<NativeFunction<rd_kafka_name_native_t>>(rd_kafka_name_symbol).asFunction();

  late final Pointer<Utf8> Function(Pointer<rd_kafka_t> rk) rd_kafka_rebalance_protocol = _lib.lookup<NativeFunction<rd_kafka_rebalance_protocol_native_t>>(rd_kafka_rebalance_protocol_symbol).asFunction();

  late final Pointer<rd_kafka_error_t> Function(Pointer<rd_kafka_t> rk, Pointer<rd_kafka_topic_partition_list_t> partitions) rd_kafka_incremental_assign = _lib.lookup<NativeFunction<rd_kafka_incremental_assign_native_t>>(rd_kafka_incremental_assign_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_t> rk, Pointer<rd_kafka_topic_partition_list_t> partitions) rd_kafka_assign = _lib.lookup<NativeFunction<rd_kafka_assign_native_t>>(rd_kafka_assign_symbol).asFunction();

  late final Pointer<rd_kafka_error_t> Function(Pointer<rd_kafka_t> rk, Pointer<rd_kafka_topic_partition_list_t> partitions) rd_kafka_incremental_unassign = _lib.lookup<NativeFunction<rd_kafka_incremental_unassign_native_t>>(rd_kafka_incremental_unassign_symbol).asFunction();

  late final Pointer<Utf8> Function(Pointer<rd_kafka_error_t> error) rd_kafka_error_string = _lib.lookup<NativeFunction<rd_kafka_error_string_native_t>>(rd_kafka_error_string_symbol).asFunction();

  late final void Function(Pointer<rd_kafka_error_t> error) rd_kafka_error_destroy = _lib.lookup<NativeFunction<rd_kafka_error_destroy_native_t>>(rd_kafka_error_destroy_symbol).asFunction();

  late final Pointer<rd_kafka_topic_conf_t> Function(Pointer<rd_kafka_conf_t> conf) rd_kafka_conf_get_default_topic_conf = _lib.lookup<NativeFunction<rd_kafka_conf_get_default_topic_conf_native_t>>(rd_kafka_conf_get_default_topic_conf_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_t> rk) rd_kafka_producev = _lib.lookup<NativeFunction<rd_kafka_producev_native_t>>(rd_kafka_producev_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_t> rk, int timeout_ms) rd_kafka_flush = _lib.lookup<NativeFunction<rd_kafka_flush_native_t>>(rd_kafka_flush_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_t> rk, Pointer<Utf8> errstr, int errstr_size) rd_kafka_fatal_error = _lib.lookup<NativeFunction<rd_kafka_fatal_error_native_t>>(rd_kafka_fatal_error_symbol).asFunction();

  late final void Function(Pointer<rd_kafka_conf_t> conf, Pointer<NativeFunction<Void Function(Pointer<rd_kafka_t>, Int, Pointer<Utf8>, Pointer<Void>)>> error_cb) rd_kafka_conf_set_error_cb = _lib.lookup<NativeFunction<rd_kafka_conf_set_error_cb_native_t>>(rd_kafka_conf_set_error_cb_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_t> rk, int err, Pointer<Utf8> reason) rd_kafka_test_fatal_error = _lib.lookup<NativeFunction<rd_kafka_test_fatal_error_native_t>>(rd_kafka_test_fatal_error_symbol).asFunction();

  late final Pointer<rd_kafka_queue_t> Function(Pointer<rd_kafka_t> rk) rd_kafka_queue_new = _lib.lookup<NativeFunction<rd_kafka_queue_new_native_t>>(rd_kafka_queue_new_symbol).asFunction();

  late final Pointer<rd_kafka_AdminOptions_t> Function(Pointer<rd_kafka_t> rk, int for_api) rd_kafka_AdminOptions_new = _lib.lookup<NativeFunction<rd_kafka_AdminOptions_new_native_t>>(rd_kafka_AdminOptions_new_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_AdminOptions_t> options, int timeout_ms, Pointer<Utf8> errstr, int errstr_size) rd_kafka_AdminOptions_set_request_timeout = _lib.lookup<NativeFunction<rd_kafka_AdminOptions_set_request_timeout_native_t>>(rd_kafka_AdminOptions_set_request_timeout_symbol).asFunction();

  late final Pointer<rd_kafka_DeleteRecords_t> Function(Pointer<rd_kafka_topic_partition_list_t> before_offsets) rd_kafka_DeleteRecords_new = _lib.lookup<NativeFunction<rd_kafka_DeleteRecords_new_native_t>>(rd_kafka_DeleteRecords_new_symbol).asFunction();

  late final void Function(Pointer<rd_kafka_t> rk, Pointer<Pointer<rd_kafka_DeleteRecords_t>> del_records, int del_record_cnt, Pointer<rd_kafka_AdminOptions_t> options, 	Pointer<rd_kafka_queue_t> rkqu) rd_kafka_DeleteRecords = _lib.lookup<NativeFunction<rd_kafka_DeleteRecords_native_t>>(rd_kafka_DeleteRecords_symbol).asFunction();

  late final void Function(Pointer<rd_kafka_DeleteRecords_t> del_records) rd_kafka_DeleteRecords_destroy = _lib.lookup<NativeFunction<rd_kafka_DeleteRecords_destroy_native_t>>(rd_kafka_DeleteRecords_destroy_symbol).asFunction();

  late final void Function(Pointer<rd_kafka_AdminOptions_t> options) rd_kafka_AdminOptions_destroy = _lib.lookup<NativeFunction<rd_kafka_AdminOptions_destroy_native_t>>(rd_kafka_AdminOptions_destroy_symbol).asFunction();

  late final Pointer<rd_kafka_event_t> Function(Pointer<rd_kafka_queue_t> rkqu, int timeout_ms) rd_kafka_queue_poll = _lib.lookup<NativeFunction<rd_kafka_queue_poll_native_t>>(rd_kafka_queue_poll_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_event_t> rkev) rd_kafka_event_error = _lib.lookup<NativeFunction<rd_kafka_event_error_native_t>>(rd_kafka_event_error_symbol).asFunction();

  late final Pointer<Utf8> Function(Pointer<rd_kafka_event_t> rkev) rd_kafka_event_error_string = _lib.lookup<NativeFunction<rd_kafka_event_error_string_native_t>>(rd_kafka_event_error_string_symbol).asFunction();

  late final Pointer<rd_kafka_DeleteRecords_result_t> Function(Pointer<rd_kafka_event_t> rkev) rd_kafka_event_DeleteRecords_result = _lib.lookup<NativeFunction<rd_kafka_event_DeleteRecords_result_native_t>>(rd_kafka_event_DeleteRecords_result_symbol).asFunction();

  late final Pointer<rd_kafka_topic_partition_list_t> Function(Pointer< rd_kafka_DeleteRecords_result_t> result) rd_kafka_DeleteRecords_result_offsets = _lib.lookup<NativeFunction<rd_kafka_DeleteRecords_result_offsets_native_t>>(rd_kafka_DeleteRecords_result_offsets_symbol).asFunction();

  late final void Function(Pointer<rd_kafka_event_t> rkev) rd_kafka_event_destroy = _lib.lookup<NativeFunction<rd_kafka_event_destroy_native_t>>(rd_kafka_event_destroy_symbol).asFunction();

  late final void Function(Pointer<rd_kafka_queue_t> rkqu) rd_kafka_queue_destroy = _lib.lookup<NativeFunction<rd_kafka_queue_destroy_native_t>>(rd_kafka_queue_destroy_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_message_t> rkmessage) rd_kafka_message_broker_id = _lib.lookup<NativeFunction<rd_kafka_message_broker_id_native_t>>(rd_kafka_message_broker_id_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_message_t> rkmessage, Pointer<Pointer<rd_kafka_headers_t>> hdrsp) rd_kafka_message_headers = _lib.lookup<NativeFunction<rd_kafka_message_headers_native_t>>(rd_kafka_message_headers_symbol).asFunction();

  late final void Function(Pointer<rd_kafka_conf_t> conf, Pointer<NativeFunction<Void Function(Pointer<rd_kafka_t>, Pointer<Utf8>, Int32, Int, Pointer<Void>)>> throttle_cb) rd_kafka_conf_set_throttle_cb = _lib.lookup<NativeFunction<rd_kafka_conf_set_throttle_cb_native_t>>(rd_kafka_conf_set_throttle_cb_symbol).asFunction();

  late final void Function(Pointer<rd_kafka_conf_t> conf, Pointer<NativeFunction<Void Function(Pointer<rd_kafka_t>, Int32, Pointer< rd_kafka_topic_partition_list_t>, Pointer<Void>)>> offset_commit_cb) rd_kafka_conf_set_offset_commit_cb = _lib.lookup<NativeFunction<rd_kafka_conf_set_offset_commit_cb_native_t>>(rd_kafka_conf_set_offset_commit_cb_symbol).asFunction();

  late final void Function(Pointer<rd_kafka_conf_t> conf, Pointer<NativeFunction<Int Function(Pointer<rd_kafka_t>, Pointer<Utf8>, Int32, Pointer<Void>)>> stats_cb) rd_kafka_conf_set_stats_cb = _lib.lookup<NativeFunction<rd_kafka_conf_set_stats_cb_native_t>>(rd_kafka_conf_set_stats_cb_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_topic_t> rkt, int partition, int offset, Pointer<rd_kafka_queue_t> rkqu) rd_kafka_consume_start_queue = _lib.lookup<NativeFunction<rd_kafka_consume_start_queue_native_t>>(rd_kafka_consume_start_queue_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_queue_t> rkqu, int timeout_ms, Pointer<NativeFunction<Void Function(Pointer<rd_kafka_message_t>, Pointer<Void>)>> consume_cb, Pointer<Void> commit_opaque) rd_kafka_consume_callback_queue = _lib.lookup<NativeFunction<rd_kafka_consume_callback_queue_native_t>>(rd_kafka_consume_callback_queue_symbol).asFunction();

  late final void Function(Pointer<rd_kafka_conf_t> conf, Pointer<NativeFunction<Void Function(Pointer<rd_kafka_t>, Int32, Pointer< rd_kafka_topic_partition_list_t>, Pointer<Void>)>> rebalance_cb) rd_kafka_conf_set_rebalance_cb = _lib.lookup<NativeFunction<rd_kafka_conf_set_rebalance_cb_native_t>>(rd_kafka_conf_set_rebalance_cb_symbol).asFunction();

  late final Pointer<rd_kafka_queue_t> Function(Pointer<rd_kafka_t> rk) rd_kafka_queue_get_consumer = _lib.lookup<NativeFunction<rd_kafka_queue_get_consumer_native_t>>(rd_kafka_queue_get_consumer_symbol).asFunction();

  late final int Function(Pointer<rd_kafka_queue_t> rkqu, int timeout_ms, Pointer<Pointer<rd_kafka_message_t>> rkmessages, int rkmessages_size) rd_kafka_consume_batch_queue = _lib.lookup<NativeFunction<rd_kafka_consume_batch_queue_native_t>>(rd_kafka_consume_batch_queue_symbol).asFunction();

}
